require 'rails_helper'

describe 'users can checkout' do
  before(:each) do
    item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
    visit item_path(item)
    click_button 'Add to Cart'
  end

  context 'user is logged in' do
    it 'allows user to checkout their cart' do

      visit cart_path

      click_on 'Checkout'

      expect(current_path).to eq(checkout_path)
    end
  end
  context 'user is not logged in' do
    it 'prompts visitor to sign up or log in' do

      expect
  end
end
