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
  end
end
