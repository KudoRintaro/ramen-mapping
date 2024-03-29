class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    shop=Shop.find(params[:shop_id])
    review=current_user.reviews.find_by(shop_id: params[:shop_id])
    if review.nil?
     Review.create(
      user_id: current_user.id, shop_id: shop.id,
      atmosphere_rate: params[:review][:atmosphere_rate],
      servise_rate: params[:review][:servise_rate],
      taste_rate: params[:review][:taste_rate],
      congestion_rate: params[:review][:congestion_rate]
     )
    else
     review.update(
      atmosphere_rate: params[:review][:atmosphere_rate],
      servise_rate: params[:review][:servise_rate],
      taste_rate: params[:review][:taste_rate],
      congestion_rate: params[:review][:congestion_rate]
     )
    end
    redirect_to request.referer
  end

  def update
    shop=Shop.find(params[:shop_id])
    Review.update(
      atmosphere_rate: params[:review][:atmosphere_rate],
      servise_rate: params[:review][:servise_rate],
      taste_rate: params[:review][:taste_rate],
      congestion_rate: params[:review][:congestion_rate]
    )
    redirect_to request.referer
  end
end
