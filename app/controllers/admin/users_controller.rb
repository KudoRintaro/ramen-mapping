class Admin::UsersController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
     @comments=@user.shop_comments
  end

  def edit
  end

  def update
  end

  def confirm_withdraw
  end

  def withdraw
  end
end
