class ProfilesController < ApplicationController

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
  end

  def delete
  end

  def show
    @pledges = Pledge.all
    @completed_pledges = Pledge.where(completed: true)
  end
end
