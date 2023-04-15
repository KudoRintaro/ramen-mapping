class Public::RanksController < ApplicationController
  def rank
    @shops=Shop.all
    @shop_favorite_ranks=Shop.find(FavoriteShop.group(:shop_id).order("count(shop_id) desc").pluck(:shop_id))

    day=Time.zone.today.wday
    days=["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"]
    @today=days[day].to_s

    @time=Time.zone.now.strftime("%H:%M")
  end
end
