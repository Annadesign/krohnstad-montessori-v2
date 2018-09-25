class Moderator < ApplicationRecord
	has_secure_password
	has_many :articles
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :username, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :fullname, presence: true
	validates :password, presence: true, length: { minimum: 6 }

end
