class Public::GenresController < ApplicationController
  def new
    @genre=Genre.new
  end

  def create
    genre=Genre.new(genre_params)
    if genre.save
      flash[:notice]="リクエストを送信しました"
    else
      flash[:notice]=nil
    end
    redirect_to request.referer
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
