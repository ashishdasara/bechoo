class User < ApplicationRecord
  has_secure_password
  has_many :advertisements, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
