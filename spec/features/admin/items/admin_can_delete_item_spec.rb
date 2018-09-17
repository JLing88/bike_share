require 'rails_helper'

describe 'Admin deletes an item item' do
  context 'as an admin' do
    it 'item can be deleted from index' do
      item_1 = Item.create(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg", status: 1)
      item_2 = Item.create(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")
      item_3 = Item.create(title: "fidget", description: "it's fidgety", price: 23, image_url: "item.jpg")
      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_store_path

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.description)
      expect(page).to have_content(item_3.price)

      first(:link, 'Delete').click

      expect(page).to_not have_content(item_1.title)
    end
  end
end
