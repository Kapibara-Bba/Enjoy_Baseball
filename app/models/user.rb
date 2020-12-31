class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

   has_many :comments, dependent: :destroy
   has_many :records, dependent: :destroy
   has_many :posts, dependent: :destroy
   belongs_to :team, optional: true
   has_many :post_comments
   has_many :post_images

   attachment :image

   enum position: {"投手":0, "捕手":1, "一塁手":2, "二塁手":3, "三塁手":4, "遊撃手":5, "外野手":6}
   enum throw: {"右投右打":0, "右投左打":1, "右投両打":2, "左投右打":3, "左投左打":4, "左投両打":5}

  validates :name, presence: true
  # validates :team_id, presence: true

end
