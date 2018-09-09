class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates_presence_of :password

  has_secure_password
end
