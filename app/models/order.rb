class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates_presence_of :status, :created_at, :updated_at, :user_id


  def total
    sub_totals = order_items.map do |order_item|
      order_item.item.price * order_item.quantity
    end
    total = sub_totals.inject(0) do |sum, subtotal|
      sum += subtotal
    end
    total
  end

  def self.by_status
    Order.group(:status).count
  end
end
