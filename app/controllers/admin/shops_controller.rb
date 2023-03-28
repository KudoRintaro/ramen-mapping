class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shops=Shop.all
  end

  def show
    @shop=Shop.find(params[:id])
    @user=@shop.user
  end

  def edit
    @shop=Shop.find(params[:id])
  end

  def update
    shop=Shop.find(params[:id])
    shop.update(admin_edit_shop_params)
    redirect_to admin_shop_path(shop.id)
  end

  private

  def admin_edit_shop_params
    params.require(:shop).permit(:name, :location, :genre_id, :business_start_hours, :business_finish_hours, :holiday, :image)
  end
end
