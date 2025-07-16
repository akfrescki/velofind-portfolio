class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    authorize @user
    @bikes = @user.bikes
    @promos = policy_scope(Promo)
  end
end
