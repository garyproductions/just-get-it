class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  default_scope {order(created_at: :desc)}

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {minimum: 6, maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
