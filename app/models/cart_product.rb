class CartProduct < ApplicationRecord

  belongs_to :cart
  has_many :advertisements

end
