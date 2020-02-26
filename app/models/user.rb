class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 15}
  VALID_PASSWORED_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true,  uniqueness: true, length: {minimum: 8, maximum: 32 }, format: {with: VALID_PASSWORED_REGEX}
  validates :artist, length: { maximum: 300 }
  validates :description, length: { maximum: 300 }

  mount_uploader :image, ImageUploader
  
  has_secure_password
  
  has_many :communities, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :join_communities
  has_many :join_community_communities, through: :communities, source: 'community'
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  acts_as_followable
  acts_as_follower
  
  enum prefecture: {
   北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
   茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
   新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
   岐阜県:21,静岡県:22,愛知県:23,三重県:24,
   滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
   鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
   徳島県:36,香川県:37,愛媛県:38,高知県:39,
   福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  
  enum age: {
    １:1,２:2,３:3,４:4,５:5,６:6,７:7,８:8,９:9,１０:10,
    １１:11,１２:12,１３:13,１４:14,１５:15,１６:16,１７:17,１８:18,１９:19,２０:20,
    ２１:21,２２:22,２３:23,２４:24,２５:25,２６:26,２７:27,２８:28,２９:29,３０:30,
    ３１:31,３２:32,３３:33,３４:34,３５:35,３６:36,３７:37,３８:38,３９:39,４０:40,
    ４１:41,４２:42,４３:43,４４:44,４５:45,４６:46,４７:47,４８:48,４９:49,５０:50,
    ５１:51,５２:52,５３:53,５４:54,５５:55,５６:56,５７:57,５８:58,５９:59,６０:60,
    ６１:61,６２:62,６３:63,６４:64,６５:65,６６:66,６７:67,６８:68,６９:69,７０:70,
    ７１:71,７２:72,７３:73,７４:74,７５:75,７６:76,７７:77,７８:78,７９:79,８０:80,
    ８１:81,８２:82,８３:83,８４:84,８５:85,８６:86,８７:87,８８:88,８９:89,９０:90,
    ９１:91,９２:92,９３:93,９４:94,９５:95,９６:96,９７:97,９８:98,９９:99,１００:100
  }
  
  enum gender: {
    男性:1,女性:2
  }
  
end
