class User < ApplicationRecord

  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,     presence: true
  validates :password, presence: true, 
                       length: { minimum: 6 }
  validates :email,    presence: true,
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }

  has_secure_password
end
