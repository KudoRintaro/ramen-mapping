class Public::SearchesController < ApplicationController

  def search
    @genre= params[:genre_id]
    redirect_to genre_path(@genre)
  end

end
