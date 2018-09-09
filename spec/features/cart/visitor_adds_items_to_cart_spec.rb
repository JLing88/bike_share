require 'rails_helper'

describe 'visitor is not logged in, cart is empty' do
  it 'displays items added to cart' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
    item_2 = Item.create(title: 'widget', description: 'neat', price: 333, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

    visit item_path(item)

    click_button 'Add to Cart'

    expect(current_path).to eq(root_path)

    visit item_path(item_2)

    click_button 'Add to Cart'

    click_link 'My Cart'
save_and_open_page
    expect(page.body).to have_content('item 1')
    expect(page.body).to have_content('widget')
  end
end
