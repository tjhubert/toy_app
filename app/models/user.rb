class User < ActiveRecord::Base
	has_many :microposts

	before_save { self.email = self.email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
	validates_presence_of :name
	has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }
end