class Public::FavoriteShopsController < ApplicationController
  def index
  end

  def create
    FavoriteShop.create(user_id: current_user.id, shop_id: params[:shop_id])
    redirect_to shops_path
  end

  def destroy
  end
end
