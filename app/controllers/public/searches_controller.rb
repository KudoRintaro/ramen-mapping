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

    day=Time.zone.today.wday
    days=["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"]
    @today=days[day].to_s

    @time=Time.zone.now.strftime("%H:%M")
  end
end
