class Public::ShopCommentsController < ApplicationController
  def create
    comment=ShopComment.new(comment_params)
    if comment.save
      flash[:notice]="コメントを投稿しました!!"
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
