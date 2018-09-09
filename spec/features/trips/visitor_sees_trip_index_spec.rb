require 'rails_helper'
describe 'as visitor' do
  context 'they visit trips index' do
    it 'should list each trip and attributes' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)

      visit trips_path
save_and_open_page
      expect(page).to have_content(trip_1.duration)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(trip_1.start_station_id)
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(trip_1.end_station_id)
      expect(page).to have_content(trip_1.bike_id)
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)
      expect(page).to have_content(trip_2.duration)
      expect(page).to have_content(trip_2.start_date)
      expect(page).to have_content(trip_2.start_station_id)
      expect(page).to have_content(trip_2.end_date)
      expect(page).to have_content(trip_2.end_station_id)
      expect(page).to have_content(trip_2.bike_id)
      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.zip_code)
    end
  end
end
