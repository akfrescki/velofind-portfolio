class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    authorize @user

    @bikes = @user.bikes
    @promos = policy_scope(Promo)

    # the total of potential matches:
    @total_matches = @bikes.sum { |bike| bike.matches.count }

    @confirmed_matches = @bikes.sum do |bike|
      bike.matches.count { |match| match.report.present? }
    end

    # scanned sources
    avg_sources_per_day = 2
    @sources_scanned = @bikes.sum do |bike|
      if bike.first_search_date.present?
        days = (Date.today - bike.first_search_date).to_i
        days = 0 if days.negative?
        avg_sources_per_day * days
      else
        0
      end
    end

    # for more than 1 bike
    @bike_days_remaining = {}

    @bikes.each do |bike|
      if bike.first_search_date.present?
        days_passed = (Date.today - bike.first_search_date).to_i
        remaining = 30 - days_passed
        @bike_days_remaining[bike.id] = remaining.positive? ? remaining : 0
      else
        @bike_days_remaining[bike.id] = 0
      end
    end

    @bike_days_remaining = @bike_days_remaining.values.compact.min || 0
  end
end
