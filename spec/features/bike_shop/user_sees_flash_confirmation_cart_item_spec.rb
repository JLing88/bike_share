require 'rails_helper'

describe 'As a user' do
  describe 'visits bike-shop' do
    it 'shows flash notice when adding item to cart' do
      item_1 = Item.create(title: "Widget_1", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_2 = Item.create(title: "Widget_2", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")

      visit bike_store_path

      first(:button, 'Add to Cart').click

      expect(page).to have_content("#{item_1.title} added to cart!")

    end
  end
end
