class Public::ReviewsController < ApplicationController

  def create
    shop=Shop.find(params[:shop_id])
    Review.create(
      user_id: current_user.id, shop_id: shop.id,
      atmosphere_rate: params[:review][:atmosphere_rate],
      servise_rate: params[:review][:servise_rate],
      taste_rate: params[:review][:taste_rate],
      congestion_rate: params[:review][:congestion_rate]
    )
    redirect_to request.referer
  end
end
