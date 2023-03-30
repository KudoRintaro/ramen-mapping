class Public::GenresController < ApplicationController
  before_action :authenticate_user!
  def new
    @genre=Genre.new
  end

  def create
    genre=Genre.new(genre_params)
    if genre.save
      flash[:notice]="ジャンル登録しました。"
      redirect_to new_genre_path
    else
      @genre=genre
      render "new"
    end
  end

  def show
    @genres=Genre.all
    @genre=Genre.find(params[:id])
    @genrespage=@genre.shops.page(params[:page]).per(3)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
