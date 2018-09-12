class User < ApplicationRecord
  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password
  validates_presence_of :address
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_secure_password

  def name
    "#{first_name} #{last_name}"
  end

end
