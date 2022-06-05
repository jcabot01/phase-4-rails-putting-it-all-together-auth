class User < ApplicationRecord
  has_secure_password   #gives us password=, password_confirmation=, and authenticate methods
  has_many :recipes

  validates :username, presence: true
  validates :username, uniqueness: true
end
