require 'rails_helper'

describe 'admin edits item' do
  before(:each) do
    @item_1 = Item.create(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg", status: 1)
    @item_2 = Item.create(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")
    @item_3 = Item.create(title: "fidget", description: "it's fidgety", price: 23, image_url: "item.jpg")
    admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  end

  context 'from the index page' do
    it 'displays each item with edit link' do
      visit admin_bike_store_path

      expect(page).to have_link("Edit")
    end

    it 'displays edited item back on the index page' do
      visit admin_bike_store_path

      expect(page).to have_content(@item_1.title)
      expect(page).to have_content(@item_1.description)
      expect(page).to have_content(@item_1.price)

      first(:link, "Edit").click

      expect(current_path).to eq(edit_admin_item_path(@item_1))

      fill_in :item_title, with: "zidget"
      fill_in :item_description, with: "it's zidgety"
      fill_in :item_price, with: 21
      fill_in :item_image_url, with: "item.jpg"
      select "active", from: "item[status]"

      click_on("Submit")

      expect(page).to have_content("zidget")
      expect(page).to have_content("it's zidgety")
      expect(page).to have_content("21")

    end
  end
end
