class PromosController < ApplicationController
  def index
    @promos = policy_scope(Promo)
  end

  def new
    @promo = Promo.new
    authorize @promo
  end

  def create
    @promo = Promo.new(promo_params)
    authorize @promo
    if @promo.save
      redirect_to dashboard_path, notice: "Promo created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def promo_params
    params.require(:promo).permit(:name, :description, :promocode, :website_url)
  end
end
