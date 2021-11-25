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
    # require 'oauth'
    @expense = Expense.new
    @expenses = Expense.all
    # is = File.binread("/Users/mado/code/Opunho/ECO-Logical/EcoLogicalFinal-sandbox.p12")
    # signing_key = OpenSSL::PKCS12.new(is, 'keystorepassword').key
    # consumer_key = "4ZDFvkPJaoiqIImp2k7Jwl7MxlMVq6iBAoBPAVGY160d7cb1!ef7e26499fd7411caaaddb52e02d09940000000000000000"
    # uri = "https://sandbox.api.mastercard.com/service"
    # method = "POST"
    # payload = {
    #                "transactionId": "ee421c25-f928-4bf6-b884-3600b76b860d",
    #                "mcc": 3997,
    #                "amount": {
    #                            "value": 100,
    #                             "currencyCode": "USD"
    #                          }
    #            }
    # @auth_header = OAuth.get_authorization_header(uri, method, payload, consumer_key, signing_key)

    # @emission = HTTParty.post(@carbon_url,
    #                           body:
    #                            )
  end

  def create
    id = Faker::Alphanumeric.alphanumeric(number: 32)
    @expense = Expense.new(expense_params)
    @expense.external_id = id
    @expense.account = @account
    if @expense.save!
      redirect_to expenses_path
    else
      render :index
    end
  end

  def set_transactions
    @transactions.parsed_response["data"].each do |transaction|
      @duplicate_chekcker = Expense.find_by(external_id: transaction["externalId"])
      if transaction["amount"].negative? && @duplicate_checker == nil
        @expense = Expense.new(
          amount: -transaction["amount"], creditor_id: transaction["creditorId"],
          creditor_name: transaction["creditorName"], date: transaction["booking_date"],
          external_id: transaction["externalId"], currency: transaction["currency"]
        )
        @expense.account = @account
        @expense.save!
      end
    end
    redirect_to expenses_path
  end

  private

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
