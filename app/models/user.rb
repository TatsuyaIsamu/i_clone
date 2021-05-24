class User < ApplicationRecord
  has_secure_password
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture
end
