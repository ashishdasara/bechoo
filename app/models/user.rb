class User < ApplicationRecord
  has_secure_password

  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :conversations

  scope :unapproved, lambda { where(approved: false)}
  scope :not_admin, lambda { where(admin: false)}
  scope :sorted, lambda { order("first_name ASC") }

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  NUMBER_REGEX = /\d{10}/

  validates :password,    presence: true,
                          allow_nil: true

  validates :first_name,  presence: true,
                          length: { maximum: 15 }
  validates :last_name,   presence: true,
                          length: { maximum: 15 }
  validates :username,    uniqueness: { case_sensitive: true },
                          length: { within: 6..20 }
  validates :email,       presence: true,
                          length: { maximum: 100 },
                          uniqueness: { case_sensitive: false },
                          format: EMAIL_REGEX
  validates :contact_no,  format: NUMBER_REGEX,
                          allow_nil: true


  before_save { |user| user.first_name = user.first_name.downcase }
  before_save { |user| user.last_name = user.last_name.downcase }
  before_save { |user|
    if user.location
      user.location = user.location.downcase
    end
  }

  def self.find_or_create_from_auth_hash(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
      user.password = SecureRandom.urlsafe_base64
		end
	end
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  def set_defaults
    self.username = "#{self.first_name}#{self.last_name}"
  end
end
