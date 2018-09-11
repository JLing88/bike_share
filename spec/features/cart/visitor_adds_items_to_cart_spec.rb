require 'rails_helper'

describe 'visitor is not logged in, cart is empty' do
  xit 'displays items added to cart, subtotals and total' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
    item_2 = Item.create(title: 'widget', description: 'neat', price: 333, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

    visit item_path(item)

    click_button 'Add to Cart'

    expect(current_path).to eq(root_path)

    visit item_path(item_2)

    click_button 'Add to Cart'

    click_link 'My Cart'

    visit item_path(item_2)

    click_button 'Add to Cart'

    click_link 'My Cart'

    expect(page.body).to have_content('item 1')
    expect(page.body).to have_content('widget')
  end
  xit 'allows visitor to increase and decrease the amount of an item' do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

    visit item_path(item)

    click_button 'Add to Cart'

    click_link 'My Cart'

    expect(page.body).to have_content('item 1')

    click_on '+'

    expect(page.body).to have_content(2)

    click_on '-'

    expect(page.body).to have_content(1)
  end
end
