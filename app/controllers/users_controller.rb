class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    authorize @user

    @bikes = @user.bikes
    @promos = policy_scope(Promo)

    # New layout. Total searched bikes
    @active_bikes = @bikes.count do |bike|
      bike.first_search_date.present? && (Date.today - bike.first_search_date).to_i <= 30
    end

    # Potential matches:
    @bikes = @user.bikes.includes(:matches)
    @total_matches = @bikes.sum { |bike| bike.matches.count }

    # Confimed matches: NOT WORKING YET, missing reports info
    @confirmed_matches = @bikes.sum do |bike|
      bike.matches.count { |match| match.report.present? }
    end
  end
end
