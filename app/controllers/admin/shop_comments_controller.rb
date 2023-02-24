class Admin::ShopCommentsController < ApplicationController
  def index
    @comments=ShopComment.all
  end

  def show
    @comment=ShopComment.find(params[:id])
    @user=@comment.user
    @shop=@comment.shop
  end

  def destroy
    comment=ShopComment.find(params[:id])
    comment.destroy
    redirect_to admin_shop_comments_path
  end
end
