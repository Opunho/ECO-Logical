class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]
  # before_action :redirect_if_signed_in

  def home
  end

  def kitchensink
  end

  # def redirect_if_signed_in
  #   redirect_to dashboard_path if user_signed_in?
  # end
end
