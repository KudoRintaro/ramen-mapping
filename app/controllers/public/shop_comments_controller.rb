class Public::ShopCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment=ShopComment.new(comment_params)
    if comment.save
      flash[:notice]="コメントを投稿しました!!"
    else
      flash[:notice]="コメントが入力されていません"
    end
    redirect_to request.referer
  end

  def destroy
    ShopComment.find_by(shop_id: params[:id], id: params[:shop_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.permit(:user_id, :shop_id, :comment)
  end
end
