require 'rails_helper'

describe Cart do
  it 'exists' do
    expect(Cart).to be
  end

  context '#items' do
    it 'returns and array of CartItems' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
      data = Hash.new(0)
      input_data = {}
      input_data[item.id.to_s] = 2
      data[item.id] = 2
      cart = Cart.new(input_data)

      expect(cart.items.first).to be_a_kind_of(CartItem)
    end
  end

  context '#data' do
    it 'return a hash with the item id and quantity' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
      input_data = {}
      input_data[item.id.to_s] = 2
      cart = Cart.new(input_data)
      expect(cart.data).to eq({item.id.to_s => 2})
    end
  end

  context '#add_item' do
    it 'updates the data method when item is added' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
      cart = Cart.new(nil)

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 1})
      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 2})
    end
  end
  context '.count_items' do
    it 'returns the total count of items in cart' do
      item_1 = Item.create(title: 'item 1', description: 'cool thing 1', price: 300, image_url: 'test.jpg')
      item_2 = Item.create(title: 'item 2', description: 'cool thing 2', price: 100, image_url: 'test.jpg')
      cart = Cart.new(nil)
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_2)

      expect(cart.count_items).to eq(4)
    end
  end
end
