require 'rails_helper'

describe 'As a visitor' do
  context 'they visit /bike-shop' do
    it 'displays an index of all items' do
      item_1 = Item.create(title: "Widget_1", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_2 = Item.create(title: "Widget_2", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_3 = Item.create(title: "Widget_3", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_4 = Item.create(title: "Widget_4", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_5 = Item.create(title: "Widget_5", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_6 = Item.create(title: "Widget_6", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_7 = Item.create(title: "Widget_7", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_8 = Item.create(title: "Widget_8", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_9 = Item.create(title: "Widget_9", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_10 = Item.create(title: "Widget_10", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_11 = Item.create(title: "Widget_11", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
      item_12 = Item.create(title: "Widget_12", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png", status: 1)

      visit bike_store_path

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_3.title)
      expect(page).to have_content(item_4.title)
      expect(page).to have_content(item_5.title)
      expect(page).to have_content(item_6.title)
      expect(page).to have_content(item_7.title)
      expect(page).to have_content(item_8.title)
      expect(page).to have_content(item_9.title)
      expect(page).to have_content(item_10.title)
      expect(page).to have_content(item_11.title)
      expect(page).to have_content(item_12.title)
    end
  end

  describe 'they are unable to add disabled item to cart' do
    it 'shows Item Unavailable and the button is disabled' do
      item_13 = Item.create(title: "Widget_1", description: "Something Sweet", price: 1.99, image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png", status: 1)
      visit bike_store_path
      
      expect(page).to have_button('Unavailable', disabled: true)
    end
  end
end
