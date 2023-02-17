class Public::ShopCommentsController < ApplicationController
  def create
    comment=Comment.new(comment_params)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:shop_comment)
  end
end
