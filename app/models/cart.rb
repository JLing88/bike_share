class Cart
  attr_reader :data

  def initialize(data)
    @data = data || Hash.new
  end

  def items
    @data.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def increase_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def total
    cart_items = items
    result = cart_items.inject(0) do |sum, cart_item|
      sum + cart_item.subtotal(cart_item)
    end
    result
  end
end
