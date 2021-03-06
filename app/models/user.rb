class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :twitter, :facebook, :linkedin, :github]

  has_many :follower_follows, foreign_key: 'followee_id', class_name: 'Follow'
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followee_follow, foreign_key: 'follower_id', class_name: 'Follow'
  has_many :followees, through: :followee_follow, source: :followee

  has_many :calendars
  has_many :calendar_users

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, source: :user

  validates_presence_of :email

  def self.find_for_oauth(access_token, signed_in_resource=nil)
    data = access_token.info

    if access_token.provider == "twitter"
      user = User.where(:email => "#{data["nickname"]}@twitter.com").first
    else
      user = User.where(:email => data["email"]).first
    end


    # users to be created if they don't exist
    if user.blank?
        user = User.new(email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    if access_token.provider == "twitter"
      user.email = "#{data["nickname"]}@twitter.com"
      user.save
    else
      user.save!
    end
    end
    user
  end
end
