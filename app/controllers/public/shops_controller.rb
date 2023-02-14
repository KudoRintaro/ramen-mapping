class Public::ShopsController < ApplicationController
  def new
    @shop=Shop.new
  end

  def create
    shop=Shop.new(shop_new_params)
    shop.save
    redirect_to shop_path(shop.id)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def shop_new_params
    params.require(:shop).permit(:user_id, :genre_id, :name, :business_start_hours, :business_finish_hours, :holiday, :location, :status, :image)
  end
end
