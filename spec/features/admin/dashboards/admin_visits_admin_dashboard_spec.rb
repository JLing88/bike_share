require 'rails_helper'

describe 'as an admin' do
  context 'admin visits admin dashboard' do
    before(:each) do
      @admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it 'has link to all accessories which directs to admin/bike_shop' do

      visit admin_dashboard_path

      click_on("See All Accessories - Go to Bike Shop")

      expect(current_path).to eq(admin_bike_store_path)
    end

    it 'displays all order for all users' do
      user = User.create!(username: "name", password: "secret", first_name: "firstname", last_name: "lastname", address: "place")

      item = Item.create(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg")
      item2 = Item.create(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")
      order1 = user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
      order_item = OrderItem.create!(item_id: item.id, order_id: order1.id, quantity: 5)
      order_item2 = OrderItem.create!(item_id: item2.id, order_id: order1.id, quantity: 10)

      visit admin_dashboard_path

      expect(page).to have_content("Order-#{order1.id}")
      within("#order-#{order1.id}") do
        expect(page).to have_content("#{order1.status}")
      end
    end

    it 'displays total number of orders by status' do
      user = User.create!(username: "name", password: "secret", first_name: "firstname", last_name: "lastname", address: "place")

      order1 = user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
      order2 = user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
      order3 = user.orders.create!(status: "paid", created_at: Time.now, updated_at: Time.now)
      order4 = user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
      order5 = user.orders.create!(status: "cancelled", created_at: Time.now, updated_at: Time.now)
      order6 = user.orders.create!(status: "paid", created_at: Time.now, updated_at: Time.now)
      order7 = user.orders.create!(status: "ordered", created_at: Time.now, updated_at: Time.now)

      visit admin_dashboard_path

      expect(page).to have_content("Total Orders Completed: 3")
      expect(page).to have_content("Total Orders Paid: 2")
      expect(page).to have_content("Total Orders Cancelled: 1")
      expect(page).to have_content("Total Orders Ordered: 1")
    end
  end
end
