class CartItem < SimpleDelegator
  attr_reader :quantity
  def initialize(item, quantity=0)
    super(item)
    @quantity = quantity
  end

  def subtotal(item)
    item.price * @quantity
  end

  # def self.total
  #   cart_items = CartItem
  #   cart_items.inject(0) do |sum, cart_item|
  #     cart_item.subtotal(cart_item)
  #   end
  # end
end
