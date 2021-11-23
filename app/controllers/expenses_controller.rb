class ExpensesController < ApplicationController
  include HTTParty
  skip_before_action :authenticate_user!

  def index
    auth_url = "https://api.mockbank.io/oauth/token"
    auth_query = { "client_id" => "eco13", "client_secret" => "ecological", "grant_type" => "password",
                   "username" => "demado@zohomail.com", "password" => "EcoLogical13!!" }
    auth_headers = { "content-type" => "application/json" }

    user = HTTParty.post(auth_url,
                         query: auth_query,
                         headers: auth_headers)
    access_token = user["access_token"]

    base_url = "https://api.mockbank.io/customers/"
    headers2 = { "content-type" => "application/json", "authorization" => "Bearer #{access_token}" }

    @customers = HTTParty.get(base_url, headers: headers2)
    @customers.parsed_response["data"].each do |customer|
      @external_id = customer["externalId"] if customer["username"] == "user2"
    end

    @transactions = HTTParty.get("#{base_url}#{@external_id}/transactions", headers: headers2)
  end
end
