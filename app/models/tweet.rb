class Tweet < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_attached_file :image,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

end
