class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users=User.all
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
    @user=User.find(params[:id])
  end

  def withdraw
    user=User.find(params[:id])

    user.update(status: false)
    flash[:admin_withdraw]="強制退会処理完了"
    redirect_to admin_users_path
  end

  private

  def admin_user_edit_params
    params.require(:user).permit(:name, :kana, :email, :image)
  end
end
