class BikesController < ApplicationController
  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    @bike.status = "lost"
    @bike.first_search_date = Date.today

    authorize @bike

    if @bike.save
      ScrapeAndMatchJob.perform_later(@bike.id)
      redirect_to dashboard_path, notice: "Bike submitted successfully."
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  def update
    @bike = Bike.find(params[:id])
    authorize @bike

    if @bike.update(bike_params)
      redirect_to dashboard_path, notice: "Bike updated successfully."
    else
      redirect_to dashboard_path, alert: "Update failed."
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
