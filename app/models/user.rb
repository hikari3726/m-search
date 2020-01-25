class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :artist, length: { maximum: 300 }
  validates :description, length: { maximum: 300 }

  mount_uploader :image, ImageUploader
  
  has_secure_password
  
  has_many :communities, dependent: :destroy
  has_many :posts, dependent: :destroy
  
end
