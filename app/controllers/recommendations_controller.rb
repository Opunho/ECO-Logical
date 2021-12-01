class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
    @reco_selected = true
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    @reco_selected = true
  end
end
