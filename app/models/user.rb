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
  has_many :join_communities
  has_many :join_community_communities, through: :communities, source: 'community'
  has_many :rooms, dependent: :destroy
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: 'following'
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: 'follower'
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  
end
