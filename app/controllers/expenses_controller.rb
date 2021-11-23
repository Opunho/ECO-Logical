class ExpensesController < ApplicationController
  include HTTParty
  skip_before_action :authenticate_user!

  def index
    base_url = "https://api.mockbank.io/oauth/token"
    query = { "client_id" => "eco13", "client_secret" => "ecological", "grant_type" => "password",
              "username" => "demado@zohomail.com", "password" => "EcoLogical13!!" }
    headers = { "content-type" => "application/json", "authorization" => "Bearer 54a6a795-87fe-4150-aad3-fbf573ce2fa5" }

    @user = HTTParty.post(base_url,
                          query: query,
                          headers: headers)
  end
end
