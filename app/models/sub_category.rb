class SubCategory < ApplicationRecord

  belongs_to :category

  has_many :advertisements, dependent: :destroy

  validates :category_id, presence: true
  validates :name, presence: true

  scope :sorted, lambda { order("name ASC") }

  before_save { |sub_category| sub_category.name = sub_category.name.downcase }

end
