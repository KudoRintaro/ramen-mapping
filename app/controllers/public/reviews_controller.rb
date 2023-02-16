class Public::ReviewsController < ApplicationController

  def create
    shop=Shop.find(params[:shop_id])
    Review.create(user_id: current_user.id, shop_id: shop.id)
    redirect_to request.referer
  end
end
