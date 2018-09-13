require 'rails_helper'

describe "As an admin they visit the trip_index_path" do
  context "they click Add New Trip" do
    context "they fill in the form and click Submit" do
      it 'should show the new trip on a show page' do
        admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        station = station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
        visit trips_path

        click_on "Add New Trip"

        expect(current_path).to eq(new_admin_trip_path)

        fill_in :trip_duration, with: 66
        fill_in :trip_start_date, with: "2018-10-3"
        fill_in :trip_start_station_id, with: 1
        fill_in :trip_end_date, with: "2018-10-4"
        fill_in :trip_end_station_id, with: 1
        fill_in :trip_bike_id, with: 234
        fill_in :trip_subscription_type, with: "monthly"
        fill_in :trip_zip_code, with: 94040
        click_on "Create"
        trip = Trip.last
        expect(current_path).to eq(trip_path(trip))
        expect(page).to have_content("Start Station Name: Wads")
        expect(page).to have_content("End Station Name: Wads")
        expect(page).to have_content("Bike Id: 234")
        expect(page).to have_content("Subscription Type: monthly")
        expect(page).to have_content("Zip Code: 94040")
      end
    end
  end
end
