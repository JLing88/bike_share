require "rails_helper"

describe "User visits stations show" do
  context "as an admin" do

    it "has edit and delete buttons per station" do

      @station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      trip = Trip.create!(duration: 60, start_date: Time.now, start_station_id: @station_1.id, end_date: Time.now, end_station_id: @station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)

      @admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit station_path(@station_1)

      expect(page).to have_content(@station_1.name)
      expect(page).to have_content(@station_1.dock_count)
      expect(page).to have_content(@station_1.city)
      expect(page).to have_content(@station_1.installation_date)
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")

    end

    it 'allows admin to delete a station from station index' do
      @station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      @admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit station_path(@station_1)

      expect(page).to have_content("Wads")

      click_on "Delete"

      expect(current_path).to eq(stations_path)
      expect(page).to_not have_content("Wads")
      expect(page).to have_content("Station deleted.")

    end
  end

  context "as a default user" do
    it "does not allow default user to see edit or delete buttons per station" do
      @station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      user = User.create!(username: "notBoss", password: "444444", first_name: "firstname", last_name: "lastname", address: "place")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit station_path(@station_1)

      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Delete")
    end
  end
end
