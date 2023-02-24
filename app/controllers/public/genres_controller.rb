class Public::GenresController < ApplicationController
  def new
    @genre=Genre.new
  end

  def create
    genre=Genre.new(genre_params)
    if genre.save
      flash[:notice]="ジャンル登録しました。"
    else
      flash[:notice]=nil
    end
    redirect_to request.referer
  end

  def show
    @genres=Genre.all
    @genre=Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
