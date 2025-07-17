class BikesController < ApplicationController
  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      redirect_to root_path, notice: "Bike submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :model, :frame_number, :color, :bike_type, pictures: [])
  end
end
