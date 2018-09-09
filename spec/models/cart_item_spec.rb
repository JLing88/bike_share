require 'rails_helper'

describe CartItem do
  it 'returns the name of the item' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
    cart_item = CartItem.new(item)

    expect(cart_item.title).to eq('item 1')
  end
  it 'returns the quantity of the item' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
    cart_item = CartItem.new(item, 2)

    expect(cart_item.quantity).to eq(2)
  end
end
