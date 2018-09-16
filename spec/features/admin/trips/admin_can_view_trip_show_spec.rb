require 'rails_helper'

describe 'As an admin' do
  context 'they visit the trip show page' do
    it 'shows buttons for Edit and Delete' do
      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Denver', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      visit trip_path(trip_1)

      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
    end
  end
end
