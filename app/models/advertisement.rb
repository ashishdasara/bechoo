class Advertisement < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :sub_category

  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :conversations, dependent: :destroy

  validates :name,            presence: true
  validates :description,     presence: true
  validates :price,           presence: true
  validates :location,        presence: true
  validates :user_username,   presence: true,
                              length: {maximum: 20}
  validates :category_id,     presence: true,
                              allow_nil: true
  validates :sub_category_id, presence: true,
                              allow_nil: true

  scope :approved,            lambda { where(approved: true)}
  scope :unapproved,          lambda { where(approved: false)}
  scope :rejected,            lambda { where(rejected: true)}
  scope :unrejected,          lambda { where(rejected: false)}
  scope :newest_first,        lambda { order("created_at DESC") }
  scope :search_name,         lambda {|search_name| where(["name LIKE ?", "%#{search_name}%"])}
  scope :search_location,     lambda {|search_location| where(["location LIKE ?", "%#{search_location}%"])}
  scope :search_category,     lambda {|category_id| where(["category_id LIKE ?", "%#{category_id}%"])}
  scope :search_sub_category, lambda {|sub_category_id| where(["sub_category_id LIKE ?", "%#{sub_category_id}%"])}

  before_save { |advert| advert.name = advert.name.downcase }
  before_save { |advert| advert.location = advert.location.downcase }
end
