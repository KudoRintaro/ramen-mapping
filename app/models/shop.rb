class Shop < ApplicationRecord
  geocoded_by :location
  after_validation :geocode

  belongs_to :user
  belongs_to :genre
  has_many :favorite_shops, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  validates :business_start_hours, presence: true
  validates :business_finish_hours, presence: true
  validates :holiday, presence: true
  validates :image, presence: true

  def self.looks(search, word)
    @shop=Shop.where("name LIKE?", "%#{word}%")
  end
end
