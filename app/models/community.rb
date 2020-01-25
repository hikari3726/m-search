class Community < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :posts, dependent: :destroy
  
  def self.search(search)
    if search
      Community.where(['content LIKE ?', "%#{search}%"])
    else
      Community.all
    end
  end
end
