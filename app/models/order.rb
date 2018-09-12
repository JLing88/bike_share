class Order < ApplicationRecord
  belongs_to :user
  validates_presence_of :status, :created_at, :updated_at, :user_id

end
