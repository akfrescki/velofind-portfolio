class BikesController < ApplicationController
  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    @bike.status = "lost"
    @bike.first_search_date = Date.today

    authorize @bike

    if @bike.save
      redirect_to dashboard_path, notice: "Bike submitted successfully."
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(
    :brand,
    :frame_number,
    :model,
    :color,
    :stolen_date,
    :location_lost,
    :status,
    :first_search_date,
    pictures: []
    )
  end
end
