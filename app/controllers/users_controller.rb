class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    authorize @user
    @bikes = @user.bikes
  end
end
