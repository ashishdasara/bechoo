class User < ApplicationRecord
  has_secure_password
  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_one :cart, dependent: :destroy

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  NUMBER_REGEX = /\d{10}/
  validates :first_name,  presence: true,
                          length: { maximum: 15 }
  validates :last_name,   presence: true,
                          length: { maximum:15 }
  validates :username,    presence: true,
                          uniqueness: true,
                          length: { within: 8..20 }
  validates :email,       presence: true,
                          length: { maximum: 100 },
                          format: EMAIL_REGEX
  validates :contact_no,  presence: true,
                          format: NUMBER_REGEX

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  before_save { |user| user.first_name = user.first_name.downcase }
  before_save { |user| user.last_name = user.last_name.downcase }
  before_save { |user| user.location = user.location.downcase }

end
