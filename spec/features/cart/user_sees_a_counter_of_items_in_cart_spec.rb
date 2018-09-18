require 'rails_helper'

describe "As a user" do
  it "shows a counter of items in the cart in navbar" do
    item_1 = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
    item_2 = Item.create(title: 'widget', description: 'neat', price: 333, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')

    visit bike_store_path
    within("#item-#{item_1.id}") do
      click_button "Add to Cart"
      click_button "Add to Cart"
      click_button "Add to Cart"
    end

    within("#item-#{item_2.id}") do
      click_button "Add to Cart"
    end

    expect(page).to have_content("My Cart = 4")
  end
end
