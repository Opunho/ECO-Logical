class DashboardsController < ApplicationController

  def show
    @accounts = current_user.accounts
    @calculations = current_user.calculations
    # raise
  end
end
