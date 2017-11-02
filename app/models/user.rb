class User < ApplicationRecord
  has_secure_password
  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_one :cart, dependent: :destroy

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name,  presence: true,
                          length: { maximum: 15}
  validates :last_name,   presence: true
  validates :username,    length: { within: 8..20 }
  validates :email,       presence: true,
                          length: { maximum: 100 },
                          format: EMAIL_REGEX
  validates :contact_no,  presence: true,
                          length: { is: 10 }

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
