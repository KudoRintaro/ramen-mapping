class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorited_shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
end
