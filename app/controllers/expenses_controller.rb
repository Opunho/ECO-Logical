require 'openssl'
require 'faker'

class ExpensesController < ApplicationController
  include HTTParty
  # skip_before_action :authenticate_user!
  before_action :set_api_variables
  before_action :fetch_transactions
  before_action :set_account
  before_action :set_expenses

  def index
    @expense = Expense.new
    @expenses = Expense.all
    @sub_categories = @expense.sub_category
  end

  def create
    id = Faker::Alphanumeric.alphanumeric(number: 32)
    @expense = Expense.new(expense_params)
    @expense.external_id = id
    @expense.account = @account
    @expense.creditor_id = @expense.emmission_data(params[:expense][:sub_category])
    if @expense.save!
      create_emmission
      redirect_to expenses_path
    else
      render :index
    end
  end

  def set_transactions
    @transactions.parsed_response["data"].each do |transaction|
      duplicate_checker = Expense.find_by(external_id: transaction["externalId"])
      if transaction["amount"].negative? && duplicate_checker == nil
        @expense = Expense.new(
          amount: -transaction["amount"], creditor_id: transaction["creditorId"],
          creditor_name: transaction["creditorName"], date: transaction["booking_date"],
          external_id: transaction["externalId"], currency: transaction["currency"]
        )
        @expense.account = @account
        if @expense.save!
          create_emmission
        end
      end
    end
    redirect_to expenses_path
  end

  private

  def create_emmission
    @emmission = Emmission.new(mcc: @expense.creditor_id.to_i)
    @emmission.expense = @expense
    if @emmission.save!
      populate_emmission
    end
  end

  def populate_emmission
    @emmission.calculator.each do |object|
      if @emmission.mcc == object[:mcc]
        @emmission.co2_grams = object[:carbon]
        @emmission.main_category = object[:category][:mainCategory]
        @emmission.sub_category = object[:category][:subCategory]
        @emmission.save
      end
    end
  end

  def expense_params
    params.require(:expense).permit(:creditor_name, :amount, :currency, :date)
  end

  def access_token
    auth_url = "https://api.mockbank.io/oauth/token"
    auth_query = { "client_id" => "eco13", "client_secret" => "ecological",
                   "grant_type" => "password",
                   "username" => "demado@zohomail.com", "password" => "EcoLogical13!!" }
    auth_headers = { "content-type" => "application/json" }
    user = HTTParty.post(auth_url,
                         query: auth_query,
                         headers: auth_headers)
    user["access_token"]
  end

  def customer_id
    customers = HTTParty.get(@customer_url, headers: @headers)
    customers.parsed_response["data"].each do |customer|
      return customer["externalId"] if customer["username"] == current_user.first_name
    end
  end

  def set_api_variables
    @customer_url = "https://api.mockbank.io/customers/"
    @headers = { "content-type" => "application/json",
                 "accept" => "application/json",
                 "authorization" => "Bearer #{access_token}" }
    @carbon_url = "https://sandbox.api.mastercard.com/carbon/transaction-footprints/"
  end

  def set_account
    response = HTTParty.get("#{@customer_url}#{customer_id}/accounts", headers: @headers)
    @account = Account.new(name: current_user,
                           account_number: response.parsed_response["data"][0]["iban"])
    @account.user = current_user
    @account.save!
  end

  def fetch_transactions
    @transactions = HTTParty.get("#{@customer_url}#{customer_id}/transactions", headers: @headers)
  end

  def set_expenses
    @expenses = Expense.all
  end
end
