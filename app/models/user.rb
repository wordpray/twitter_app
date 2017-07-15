class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: 50}
  validates :nickname,length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}
  validates :introduction, length: {maximum: 140}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
  has_attached_file :wallpaper,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :wallpaper,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Tweet.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
