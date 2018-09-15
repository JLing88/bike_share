require 'rails_helper'

describe 'admin visits bike shop / item index' do

  before(:each) do
    item_1 = Item.create(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg")
    item_2 = Item.create(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")
    item_3 = Item.create(title: "fidget", description: "it's fidgety", price: 23, image_url: "item.jpg")
    admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  it 'displays each item with edit link' do
    visit items_path

    within(".item_#{item_1.id}") do
      expect(page).to have_link("Edit")
    end
  end
end
