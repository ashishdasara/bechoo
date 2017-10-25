class SubCategory < ApplicationRecord

  belongs_to :category
  has_many :advertisements, :dependent => :destroy

  scope :sorted, lambda { order("name ASC") }
end
