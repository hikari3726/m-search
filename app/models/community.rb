class Community < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :join_communities
  has_many :join_community_users, through: :join_communities, source: 'user'
  

end
