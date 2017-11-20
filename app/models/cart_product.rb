class CartProduct < ApplicationRecord

  belongs_to :cart

  has_one :advertisement

  validates :quantity,  presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :newest_first, lambda { order("created_at DESC") }
end
