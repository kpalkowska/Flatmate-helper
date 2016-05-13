class Flatmate < ActiveRecord::Base
  belongs_to :Flat, required: false
  before_save { email.downcase! }
  validates :firstname, presence: true, length: { maximum: 20 }
  validates :lastname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
		    format: { with: VALID_EMAIL_REGEX },
		    uniqueness: { case_sensitive: false }
  validates :phone, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
