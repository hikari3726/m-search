class Room < ApplicationRecord
  validates :user_id, presence: true
  validates :sender_id, presence: true
  validates :content, presence: true
  
  belongs_to :user
  
end
