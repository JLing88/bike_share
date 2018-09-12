require 'rails_helper'

describe "As a registered user" do
  context 'they visit /trips-dashboard' do
    it 'they should see average ride duration' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_3 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
    end
  end
end
