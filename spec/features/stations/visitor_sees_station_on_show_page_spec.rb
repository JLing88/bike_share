require 'rails_helper'

describe 'as a visitor' do
  context 'they visit station show page' do
    it 'should shows the name in the uri' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)


      visit station_path(station)

      expect(current_path).to eq(station_path(station.slug))

    end

    it 'should show all attributes for the station' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit station_path(station)

      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)
    end
  end

  context 'as a registered user' do
    it 'should show analytics info for the station' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 7, subscription_type: 'monthly', zip_code: 80333)
      trip_3 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 12, subscription_type: 'monthly', zip_code: 80444)

      visit station_path(station_1)

      expect(page).to have_content("Total Number of Trips Started at this Station: 2")
      expect(page).to have_content("Total Number of Trips Ended at this Station: 1")
      expect(page).to have_content("Most Frequent Destination from this Station: #{station_2.name}")
      expect(page).to have_content("Most Frequent Origination to this Station: #{station_2.name}")

    end
  end
end
