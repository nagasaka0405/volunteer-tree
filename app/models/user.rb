class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーは複数の記録を持つ
  has_many :records, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true

  # ユーザーをフォローする
  def follow(user_id)
    followers.create(followed_id: user_id)
  end

  #ユーザーのフォローを外す
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end
end

