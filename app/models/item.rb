class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, uniqueness: true, presence: true
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image_url

  enum status: ["active", "retired"]

end
