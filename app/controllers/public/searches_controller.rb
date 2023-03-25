class Public::SearchesController < ApplicationController
 before_action :authenticate_user!

  def genre_search
    genre= params[:genre_id]
    if genre.present?
      redirect_to genre_path(genre)
    else
      redirect_to shops_path
    end
  end

  def name_search
    @shops=Shop.looks(params[:search], params[:word])
  end
end
