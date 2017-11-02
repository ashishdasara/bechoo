class Comment < ApplicationRecord
  belongs_to :advertisement
  belongs_to :user

  validates :text, presence: true
  validates :user_id, presence: true
  validates :advertisement_id, presence: true

  scope :approved, lambda { where(:approved => true)}
  scope :unapproved, lambda { where(:approved => false)}
  scope :newest_first, lambda { order("created_at DESC") }
end
