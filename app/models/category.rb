class Category < ApplicationRecord

  before_save { |category| category.name = category.name.downcase }
  
  has_many :sub_categories, dependent: :destroy
  has_many :advertisements, dependent: :destroy

  validates :name, presence: true

  scope :sorted, lambda { order("name ASC") }

end
