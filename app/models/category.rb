class Category < ApplicationRecord


  has_many :sub_categories, :dependent => :destroy
  has_many :advertisements, :dependent => :destroy

  validates :name, presence: true
  scope :sorted, lambda { order("name ASC") }
end
