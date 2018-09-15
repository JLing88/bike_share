describe 'as a admin' do
  context 'they visit the trip index page' do
    context 'they click Edit and fill in the _form' do
      it 'displays the updated info on the index page' do
        admin = User.create(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
        station_2 = Station.create!(name: 'Denver', dock_count: 15, city: 'Denver', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Date.parse("2017-10-29"),
                              start_station_id: station_1.id,
                              end_date: Date.parse("2017-11-29"),
                              end_station_id: station_1.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )

        visit trips_path

        click_link "Edit"

        expect(current_path).to eq(edit_admin_trip_path(trip_1))

        fill_in :trip_duration, with: 50
        fill_in :trip_start_date, with: Time.now
        fill_in :trip_end_date, with: Time.now
        fill_in :trip_start_station_id, with: 2
        fill_in :trip_end_station_id, with: 2
        fill_in :trip_subscription_type, with: 'weekly'
        fill_in :trip_bike_id, with: 377
        fill_in :trip_zip_code, with: 94040

        click_on "Update"

        expect(current_path).to eq(trip_path(trip_1))
        expect(page).to have_content("Duration: 50")
        expect(page).to have_content("Start Station Name: Denver")
        expect(page).to have_content("End Station Name: Denver")
        expect(page).to have_content("Subscription Type: weekly")
        expect(page).to have_content("Bike Id: 377")
        expect(page).to have_content("Zip Code: 94040")
      end
    end
  end
end
