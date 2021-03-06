class Picture < ApplicationRecord
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user ,dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
