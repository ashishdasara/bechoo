class Advertisement < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :sub_category
  has_many :comments, :dependent => :destroy

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "200x200#", small: "100x100#" }, :url  => "/assets/images/users/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/images/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name,            presence: true
  validates :description,     presence: true
  validates :price,           presence: true
  validates :location,        presence: true
  validates :user_username,   presence: true,
                              length: { within: 8..20}
  validates :user_contact_no, presence: true,
                              length: { is: 10 }
  validates :category_id,     presence: true
  validates :sub_category_id, presence: true


  scope :approved, lambda { where(:approved => true)}
  scope :unapproved, lambda { where(:approved => false)}
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search_name, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
  scope :search_location, lambda {|query| where(["location LIKE ?", "%#{query}%"])}

end
