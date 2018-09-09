require 'rails_helper'

describe 'visitor is not logged in, cart is empty' do
  it 'displays items added to cart' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'test.jpg')
    item_2 = Item.create(title: 'widget', description: 'neat', price: 333, image_url: 'image.jpg')

    visit item_path(item)

    click_button 'Add To Cart'

    expect(current_path).to eq(root_path)

    visit item_path(item_2)

    click_button 'Add To Cart'

    click_link 'My Cart'

    within('name') do
      expect(page.body).to have_content('item 1')
    end
    within('quantity') do
      expect(page.body).to have_content(2)
    end
  end
end
