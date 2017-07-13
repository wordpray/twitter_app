class User < ApplicationRecord
  validates :name, presence: true
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
