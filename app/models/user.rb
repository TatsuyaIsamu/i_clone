class User < ApplicationRecord
  has_secure_password
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture, dependent: :destroy
  validates :email, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 30 }
  mount_uploader :user_image, ImageUploader
end
