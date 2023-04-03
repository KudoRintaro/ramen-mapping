class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def index
    @shopspage=current_user.shops.page(params[:page]).per(3)
  end

  def comments
    @comments=current_user.shop_comments
  end

  def edit
    @user=current_user
  end

  def update
    user=current_user
    user.update(user_params)
    redirect_to users_my_page_path
  end

  def withdraw
    user=current_user

    user.update(status: false)
    reset_session
    flash[:withdraw]="退会しました"
    redirect_to root_path
  end

  def comment_destroy
    comment=ShopComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end


  private

  def user_params
    params.require(:user).permit(:name, :kana, :email, :image)
  end
end
