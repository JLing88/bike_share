require 'rails_helper'
describe 'as visitor' do
  context 'they visit trips index' do
    it 'should list each trip and attributes' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)

      visit trips_path

      expect(page).to have_content(trip_1.duration)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(trip_1.start_station_name(trip_1))
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(trip_1.end_station_name(trip_1))
      expect(page).to have_content(trip_1.bike_id)
      expect(page).to have_content(trip_1.subscription_type)
      expect(page).to have_content(trip_1.zip_code)
      expect(page).to have_content(trip_2.duration)
      expect(page).to have_content(trip_2.start_date)
      expect(page).to have_content(trip_2.start_station_name(trip_2))
      expect(page).to have_content(trip_2.end_date)
      expect(page).to have_content(trip_2.end_station_name(trip_2))
      expect(page).to have_content(trip_2.bike_id)
      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.zip_code)
    end
    it 'shows first 30 trips' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Sodosopa', dock_count: 11, city: 'South Park', installation_date: Time.now)

      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_3 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_4 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_5 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_6 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_7 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_8 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_9 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_10 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_11 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_12 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_13 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_14 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_15 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_16 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_17 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_18 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_19 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_20 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_21 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_22 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_23 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_24 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_25 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_26 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_27 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_28 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_29 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_30 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)
      trip_31 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_3.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 2, subscription_type: 'stolen', zip_code: 90210)

      visit trips_path

      expect(page).to_not have_content(trip_31.start_station_name(trip_31))
    end
  end
end
