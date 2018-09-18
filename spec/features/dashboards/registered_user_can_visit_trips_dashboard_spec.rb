require 'rails_helper'

describe "As a registered user" do
  context 'they visit /trips-dashboard' do
    it 'they should see average ride duration' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      visit trips_dashboard_path

      expect(page).to have_content("Average Ride Duration: 55")
    end

    it 'they should show longest and shortest ride' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      visit trips_dashboard_path

      expect(page).to have_content("Longest Ride: #{trip_1.duration} minutes from #{trip_1.start_station.name} to #{trip_1.end_station.name} on #{trip_1.start_date}")
      expect(page).to have_content("Shortest Ride: #{trip_2.duration} minutes from #{trip_2.start_station.name} to #{trip_2.end_station.name} on #{trip_2.start_date}")
    end
    it 'should display the stations most used as start and end points' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                           )
      visit trips_dashboard_path

      expect(page).to have_content("Station Most Used As A Starting Point: #{station_2.name}")
      expect(page).to have_content("Station Most Used As An Ending Point: #{station_2.name}")
    end
    it 'should display the stations most and least ridden bikes' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                           )
      visit trips_dashboard_path

      expect(page).to have_content("Most Ridden Bike: Bike Id - #{trip_4.bike_id}")
      expect(page).to have_content("Least Ridden Bike: Bike Id - #{trip_1.bike_id}")
    end
    it 'should display the subscription data' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'customer',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-25"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-25"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'customer',
                            zip_code: 90210
                           )
      visit trips_dashboard_path

      expect(page).to have_content("Number of subscribers: 2 Subscribers")
      expect(page).to have_content("Number of customers: 2 Customers")
      expect(page).to have_content("Percentage of Subscribers: 50.0%")
      expect(page).to have_content("Percentage of Customers: 50.0%")
    end
    it 'should display the busiest and least busy day' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'customer',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-25"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-25"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'customer',
                            zip_code: 90210
                           )
      visit trips_dashboard_path
      expect(page).to have_content("Busiest Day: 2017-10-29")
      expect(page).to have_content("Least Busy Day: 2017-10-25")
    end
    it 'should display monthly breakdown of trips' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'customer',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-25"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-25"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'customer',
                            zip_code: 90210
                           )
      visit trips_dashboard_path

    expect(page).to have_css('table', text: '10')
    expect(page).to have_css('table', text: '4')
    end
    it 'should display yearly breakdown of trips' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2018-10-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'customer',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2018-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2018-10-25"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-25"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'customer',
                            zip_code: 90210
                           )
      visit trips_dashboard_path

      expect(page).to have_css('table', text: '2017')
      expect(page).to have_css('table', text: '2018')
      expect(page).to have_css('table', text: '3')
      expect(page).to have_css('table', text: '1')
    end
  end
end
