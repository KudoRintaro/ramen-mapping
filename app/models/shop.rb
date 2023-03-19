class Shop < ApplicationRecord
  geocoded_by :location
  after_validation :geocode

  belongs_to :user
  belongs_to :genre
  has_many :favorited_shops, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  def self.looks(search, word)
    @shop=Shop.where("name LIKE?", "%#{word}%")
  end
end
