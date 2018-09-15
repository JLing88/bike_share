class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates_presence_of :order_id
  validates_presence_of :item_id

  def subtotal
    item.price * quantity
  end
end
