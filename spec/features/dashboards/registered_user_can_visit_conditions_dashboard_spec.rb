require 'rails_helper'

describe 'As a registered user' do
  context 'they visit /conditions-dashboard' do
    it 'displays average number of rides per' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-8-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_2 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-8-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_3 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-05-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_4 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-05-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_5 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-7-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_6 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-7-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_7 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-06-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_8 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-06-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_9 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-04-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_10 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-04-29'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_11 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-03-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
      trip_12 = Trip.create!(duration: 60, start_date: DateTime.parse('2018-03-19'), start_station_id: station_1.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)

      condition_1 = Condition.create!(date: DateTime.parse('2018-8-29'),
                                      max_temp: 85.0,
                                      mean_temp: 55.0,
                                      min_temp:1.0,
                                      mean_humidity: 30.0,
                                      mean_visibility: 3.0,
                                      mean_windspeed: 10.0,
                                      precipitation: 2.0
                                    )
      condition_2 = Condition.create!(date: DateTime.parse('2018-05-19'),
                                      max_temp: 75.0,
                                      mean_temp: 45.0,
                                      min_temp:5.0,
                                      mean_humidity: 70.0,
                                      mean_visibility: 14.0,
                                      mean_windspeed: 12.0,
                                      precipitation: 5.0
                                    )
      condition_3 = Condition.create!(date: DateTime.parse('2018-7-29'),
                                      max_temp: 65.0,
                                      mean_temp: 55.0,
                                      min_temp:1.0,
                                      mean_humidity: 30.0,
                                      mean_visibility: 3.0,
                                      mean_windspeed: 10.0,
                                      precipitation: 2.0
                                    )
      condition_4 = Condition.create!(date: DateTime.parse('2018-06-19'),
                                      max_temp: 95.0,
                                      mean_temp: 45.0,
                                      min_temp:5.0,
                                      mean_humidity: 70.0,
                                      mean_visibility: 14.0,
                                      mean_windspeed: 12.0,
                                      precipitation: 5.0
                                    )
      condition_5 = Condition.create!(date: DateTime.parse('2018-04-29'),
                                      max_temp: 45.0,
                                      mean_temp: 55.0,
                                      min_temp:1.0,
                                      mean_humidity: 30.0,
                                      mean_visibility: 3.0,
                                      mean_windspeed: 10.0,
                                      precipitation: 2.0
                                    )
      condition_6 = Condition.create!(date: DateTime.parse('2018-03-19'),
                                      max_temp: 55.0,
                                      mean_temp: 45.0,
                                      min_temp:5.0,
                                      mean_humidity: 70.0,
                                      mean_visibility: 14.0,
                                      mean_windspeed: 12.0,
                                      precipitation: 5.0
                                    )
      visit conditions_dashboard_path

      expect(page).to have_content('Average Number of Rides between 40-50 degrees F: 0.17')
      expect(page).to have_content('Average Number of Rides between 50-60 degrees F: 0.17')
      expect(page).to have_content('Average Number of Rides between 60-70 degrees F: 0.17')
      expect(page).to have_content('Average Number of Rides between 70-80 degrees F: 0.17')
      expect(page).to have_content('Average Number of Rides between 80-90 degrees F: 0.17')
      expect(page).to have_content('Average Number of Rides between 90-100 degrees F: 0.17')


    end
  end
end
