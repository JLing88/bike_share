require 'rails_helper'

describe 'users can checkout' do
  context 'user is logged in' do
    it 'allows user to checkout their cart, resets cart to 0' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
      item2 = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

      visit item_path(item)

      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click

      visit cart_path

      click_on 'Checkout'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Successfully submitted your order totaling $300")
      expect(page).to have_content('$300')
      expect(page).to have_content('My Cart = 0')
    end
  end
  context 'user is not logged in' do
    it 'prompts visitor to log in' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
      item2 = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
      visit item_path(item)

      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click

      visit cart_path

      click_on 'Sign In To Checkout'

      expect(current_path).to eq(login_path)
    end
  end

  context 'visitor is not signed up' do
    it 'prompts visitor to sign up' do
      item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
      item2 = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

      visit item_path(item)

      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click

      visit cart_path

      click_on 'Sign Up To Checkout'

      expect(current_path).to eq(new_user_path)
    end
  end
end
