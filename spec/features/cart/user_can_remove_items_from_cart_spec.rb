require 'rails_helper'

describe 'users can remove a selected item from cart' do
  describe 'from cart show user can click button to remove list item' do
    it 'removes item from cart' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
      item_2 = Item.create(title: 'widget', description: 'neat', price: 333, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

      visit item_path(item)

      click_button 'Add to Cart'

      visit item_path(item_2)

      click_button 'Add to Cart'

      click_link 'My Cart'
      first(:button, 'Remove').click


      expect(current_path).to eq(cart_path)
      expect(page).to have_content(item_2.name)
      expect(page).to_not have_content(item_1.name)

    end
  end
end
