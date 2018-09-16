require 'rails_helper'

describe 'user creates new item' do
  context 'as an admin links from the item index (admin bike shop)' do
    it 'shows new item on show page and index' do
      item_1 = Item.create(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg", status: 1)
      item_2 = Item.create(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")
      item_3 = Item.create(title: "fidget", description: "it's fidgety", price: 23, image_url: "item.jpg")
      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_store_path

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.description)
      expect(page).to have_content(item_3.price)

      click_on("Add New Bike Accessory")

      fill_in :item_title, with: "zidget"
      fill_in :item_description, with: "it's zidgety"
      fill_in :item_price, with: 21
      fill_in :item_image_url, with: "item.jpg"
      select "active", from: "item[status]"

      click_on("Submit")

      new_item = Item.last
      expect(current_path).to eq(item_path(new_item))
      expect(page).to have_content(new_item.title)
      expect(page).to have_content(new_item.description)
      expect(page).to have_content(new_item.price)

      click_on("<< Back to all Accessories")

      expect(page).to have_content(new_item.title)
      expect(page).to have_content(new_item.description)
      expect(page).to have_content(new_item.price)

    end

    it 'displays default picture if none entered' do
      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_store_path

      click_on("Add New Bike Accessory")

      fill_in :item_title, with: "zidget"
      fill_in :item_description, with: "it's zidgety"
      fill_in :item_price, with: 21
      select "retired", from: "item[status]"

      click_on("Submit")

      expect(current_path).to eq(item_path(Item.last))
      expect(page).to have_css("img[src*='item.jpg']")

    end
  end
end
