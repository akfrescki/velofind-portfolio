class MatchesController < ApplicationController
  # it will find the bike_id
  before_action :set_bike, except: [:all]
  # makes sure bike belongs to the current user logged in
  before_action :authorize_bike, except: [:all]
  before_action :require_payment, only: [:index]

  def index
    # @bike = Bike.find(params[:bike_id])
    @matches = @bike.matches

    if params[:session_id].present?
      begin
        session = Stripe::Checkout::Session.retrieve(params[:session_id])
        order = Order.find_by(checkout_session_id: session.id) # ✅ FIXED HERE

        if session.payment_status == "paid" && order && order.state != "paid"
          order.update(state: "paid")
          flash[:notice] = "Payment successful. You can now view matches."
          redirect_to bike_matches_path(@bike) and return # ✅ Optional: prevent repeat flashes
        end
      rescue => e
        Rails.logger.error "Stripe error: #{e.message}"
      end
    end

    @has_paid = Order.exists?(user_id: current_user.id, bike_id: @bike.id, state: 'paid')
  end

  def all
    @matches = Match.joins(:bike).where(bikes: { user: current_user }).order(created_at: :desc)
    authorize :match, :all?
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def authorize_bike
    authorize @bike
  end

  def require_payment
    return if params[:session_id].present?

    @bike = Bike.find(params[:bike_id])
    order = Order.find_by(user_id: current_user.id, bike_id: @bike.id, state: "paid")

    unless order
      redirect_to checkout_order_path(bike_id: @bike.id)
    end
  end
end
