class PledgesController < ApplicationController


  def index
  end

  def create
    @pledge = Pledge.new()
    @recommendation = Recommendation.find(params[:recommendation_id])
    @pledge.recommendation = @recommendation
    @pledge.user = current_user
    @pledge.completed = false
    if @pledge
      redirect_to profile_path
    else
      render "recommendations/index"
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to profile_path
  end

  def complete
  end
end
