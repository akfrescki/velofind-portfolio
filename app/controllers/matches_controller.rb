class MatchesController < ApplicationController
  # it will find the bike_id
  before_action :set_bike
  # makes sure bike belongs to the current user logged in
  before_action :authorize_bike

  def index
    @matches = @bike.matches
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def authorize_bike
    authorize @bike
  end
end
