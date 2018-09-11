class CartItem < SimpleDelegator
  attr_reader :quantity
  def initialize(item, quantity=0)
    super(item)
    @quantity = quantity
  end

  def subtotal(item)
    item.price * @quantity
  end

  def increase_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

end
