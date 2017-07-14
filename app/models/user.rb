class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
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
end
