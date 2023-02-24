class Admin::UsersController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
     @comments=@user.shop_comments
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    user=User.find(params[:id])
    user.update(admin_user_edit_params)
    redirect_to admin_user_path(user)
  end

  def confirm_withdraw
  end

  def withdraw
  end

  private

  def admin_user_edit_params
    params.require(:user).permit(:name, :kana, :email, :image)
  end
end
