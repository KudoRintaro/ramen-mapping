class Public::UsersController < ApplicationController
  def show
  end

  def index
    @shops=Shop.all
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


  private

  def user_params
    params.require(:user).permit(:name, :kana, :email, :image)
  end
end
