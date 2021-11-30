class PledgesController < ApplicationController

  def show
  end

  def index
    @pledges = Pledge.where(completed: false)
    @completed_pledges = Pledge.where(completed: true)
    @total_co2_achieved = @completed_pledges.map{|pledge| pledge.recommendation.co2_grams}.sum
    @pledge_selected = true
  end

  def create
    @pledge = Pledge.new()
    @recommendation = Recommendation.find(params[:recommendation_id])
    @pledge.recommendation = @recommendation
    @pledge.user = current_user
    @pledge.completed = false
    if @pledge.save
      redirect_to pledges_path
    else
      render "recommendations/index"
    end
    @pledge_selected = true
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to profile_path
    @pledge_selected = true
  end

  def complete
    @pledge = Pledge.find(params[:id])
    @pledge.completed = true
    if @pledge.save
      redirect_to pledges_path
    end
    @pledge_selected = true
  end
end
