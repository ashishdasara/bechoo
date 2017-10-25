class Advertisement < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :comments, :dependent => :destroy

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "200x200#" }, :url  => "/assets/images/users/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/images/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :approved, lambda { where(:approved => true)}
  scope :unapproved, lambda { where(:approved => false)}
  scope :newest_first, lambda { order("created_at DESC") }
end
