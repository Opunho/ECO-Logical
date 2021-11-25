class DashboardsController < ApplicationController

  def show
    @accounts = current_user.accounts
    @emmissions = current_user.emmissions
  end

  def calculate_emmission

  end
end
