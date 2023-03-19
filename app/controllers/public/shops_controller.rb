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
    @shops=Shop.all
  end

  def show
    @shop=Shop.find(params[:id])
    @comments=@shop.shop_comments
  end

  def edit
  end

  def update
  end

  def favorite
    @shops=current_user.favorite_shops
  end

  private

  def shop_new_params
    params.require(:shop).permit(:user_id, :genre_id, :name, :business_start_hours, :business_finish_hours, :holiday, :location, :image)
  end
end
