class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  validates :content, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :community_id, presence: true
  
  belongs_to :user
  belongs_to :community
  
end
