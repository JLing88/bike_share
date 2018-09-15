class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image_url

  enum status: ["active", "retired"]

  def change_status(item)
    if item.status == 0
      item.status = 1
    else
      item.status = 0
    end
  end
end
