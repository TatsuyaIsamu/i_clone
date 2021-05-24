class User < ApplicationRecord
  has_secure_password
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture
  validates :email, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 30 }

end
