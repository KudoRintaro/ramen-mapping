class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops
  has_many :shop_comments, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :kana, presence: true
  validates :email, presence: true, uniqueness: true
  validates :image, presence: true
end
