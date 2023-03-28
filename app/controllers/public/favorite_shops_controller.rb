class Public::FavoriteShopsController < ApplicationController
  before_action :authenticate_user!
  def create
    shop = Shop.find(params[:shop_id])
    FavoriteShop.create(user_id: current_user.id, shop_id: shop.id)
    redirect_to request.referer
  end

  def destroy
     shop = Shop.find(params[:shop_id])
    favorite_shop=FavoriteShop.find_by(user_id: current_user.id, shop_id: shop.id)
    favorite_shop.destroy
    redirect_to request.referer
  end
end

