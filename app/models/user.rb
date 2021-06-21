class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        # google以外の認証をする場合は %i[twitter, facebook]などとなります
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

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

    # クラスメソッドを作成します
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end