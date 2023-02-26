class Public::SearchesController < ApplicationController
 before_action :authenticate_user!

  def genre_search
    @genre= params[:genre_id]
    redirect_to genre_path(@genre)
  end

  def name_search
    @shops=Shop.looks(params[:search], params[:word])
  end
end
