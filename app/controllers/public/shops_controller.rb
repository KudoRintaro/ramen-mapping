class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @shop=Shop.new
  end

  def create
    shop=Shop.new(shop_new_params)
    if shop.save
      redirect_to shop_path(shop.id)
    else
      @shop=shop
      render "new"
    end
  end

  def index
    @shops=Shop.all
    @shopspage=Shop.all.page(params[:page]).per(3)

    day=Time.zone.today.wday
    days=["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"]
    @today=days[day].to_s

    @time=Time.zone.now.strftime("%H:%M")
  end

  def show
    @shop=Shop.find(params[:id])
    @comments=@shop.shop_comments

    day=Time.zone.today.wday
    days=["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"]
    @today=days[day].to_s

    @time=Time.zone.now.strftime("%H:%M")
  end

  def edit
    @shop=Shop.find(params[:id])
  end

  def update
    @shop=Shop.find(params[:id])
    if @shop.update(shop_new_params)
      redirect_to shop_path(@shop.id)
    else
      redirect_to request.referer
    end
  end

  def destroy
    shop=Shop.find(params[:id])
    shop.destroy
    redirect_to users_shops_path
  end

  def favorite
    @shops=current_user.favorite_shops.page(params[:page]).per(3)
    @time=Time.zone.now.strftime("%H:%M")
  end

  private

  def shop_new_params
    params.require(:shop).permit(:user_id, :genre_id, :name, :business_start_hours, :business_finish_hours, :holiday, :location, :image)
  end
end
