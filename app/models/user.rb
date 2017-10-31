class User < ApplicationRecord
  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_one :cart, dependent: :destroy

  has_secure_password
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
