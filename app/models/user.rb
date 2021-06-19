class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :contacts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  has_many :chats,dependent: :destroy
  has_many :rooms, through: :user_rooms
	has_many :user_rooms

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def following?(user)
    follow_user.include?(user)
  end

end