class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops
  has_many :comments, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :kana, presence: true
  validates :email, presence: true
end
