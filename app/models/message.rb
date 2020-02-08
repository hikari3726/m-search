class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 100 }
  
  belongs_to :user, dependent: :destroy
  belongs_to :room, dependent: :destroy
  
end
