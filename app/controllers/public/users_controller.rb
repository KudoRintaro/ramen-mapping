class Public::UsersController < ApplicationController
  def show
  end

  def index
  end

  def comments
  end

  def edit
    @user=current_user
  end

  def update
    user=current_user
    user.update!(user_params)
    redirect_to users_my_page_path
  end

  def confirm_withdraw
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:name, :kana, :email, :image)
  end
end
