class CartProduct < ApplicationRecord

  belongs_to :cart
  has_many :advertisements

  scope :newest_first, lambda { order("created_at DESC") }
end
