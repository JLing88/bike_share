require 'rails_helper'

describe Trip, type: :model do

  context 'relationships' do
    it {is_expected.to belong_to(:start_station)}
    it {is_expected.to belong_to(:end_station)}
  end

  context 'validations' do
    it {should validate_presence_of :duration}
    it {should validate_presence_of :start_date}
    it {should validate_presence_of :start_station_id}
    it {should validate_presence_of :end_date}
    it {should validate_presence_of :end_station_id}
    it {should validate_presence_of :bike_id}
    it {should validate_presence_of :subscription_type}
  end

  describe 'class methods' do
    it 'returns name of start station' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)

      expect(trip_1.start_station_name(trip_1)).to eq("Wads")
    end

    it 'returns name of end station' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)

      expect(trip_1.end_station_name(trip_1)).to eq("Fed Center")
    end
    it '.avg_ride_duration' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      expect(Trip.avg_ride_duration).to eq(55)
    end

    it '.longest_trip and .shortest trip' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_1.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )

      expect(Trip.longest_trip).to eq(trip_1)
      expect(Trip.shortest_trip).to eq(trip_2)
    end
    describe '.most_starting_trips' do
      it 'returns the station with the most rides as a starting point' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        expect(Trip.most_starting_trips).to eq(station_4)
      end
    describe '.most_ridden_bike and .least_ridden_bike' do
      it 'returns the bike with the most trips or least trips' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                              )

        expect(Trip.most_ridden_bike).to eq(2)
        expect(Trip.least_ridden_bike).to eq(1)
      end
    end
    describe '.total_rides_for_bike' do
      it 'returns the total number of rides for bike' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                              )
        expect(Trip.total_rides_for_bike(2)).to eq(3)
          end
        end
        describe '.busiest_day .least_busy_day' do
      it 'returns the date with the highest number of trips and amount of trips' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-11-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                              )

        expect(Trip.busiest_day).to eq("2017-10-29")
        expect(Trip.least_busy_day).to eq("2017-11-29")
      end
    end
    describe '.total_trips_for_date' do
      it 'returns total number of trips for date' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'monthly',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-11-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                              )
        expect(Trip.total_trips_for_date(trip_4.start_date)).to eq(1)
        expect(Trip.total_trips_for_date(trip_3.start_date)).to eq(3)
      end
    end
    describe '.total_trips'
      it 'it can calculate total number of trips' do
      station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
      station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_3.id,
                            end_date: Time.parse("2017-10-29"),
                            end_station_id: station_4.id,
                            bike_id: 1,
                            subscription_type: 'monthly',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_4.id,
                            end_date: Time.parse("2017-10-29"),
                            end_station_id: station_3.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Time.parse("2017-10-29"),
                            start_station_id: station_4.id,
                            end_date: Time.parse("2017-10-29"),
                            end_station_id: station_4.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                          )
      trip_4 = Trip.create!(duration: 55,
                            start_date: Time.parse("2017-11-29"),
                            start_station_id: station_4.id,
                            end_date: Time.parse("2017-11-29"),
                            end_station_id: station_4.id,
                            bike_id: 2,
                            subscription_type: 'stolen',
                            zip_code: 90210
                            )

      expect(Trip.total_trips).to eq(4)
      end
    end
    describe '.subscription_percentage' do
      it 'should calculate subscriber base by percentage' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'subscriber',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'subscriber',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-11-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                              )

        expect(Trip.subscription_count).to eq(2)
        expect(Trip.customer_count).to eq(2)
        expect(Trip.percentage_subscribers).to eq(50.0)
        expect(Trip.percentage_customers).to eq(50)
      end
    end
    describe '.rides_for_single_month'
      it 'get total trips for month' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'subscriber',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'subscriber',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-11-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                              )
                              trip_5 = Trip.create!(duration: 55,
                                                    start_date: Time.parse("2016-10-29"),
                                                    start_station_id: station_4.id,
                                                    end_date: Time.parse("2016-10-29"),
                                                    end_station_id: station_4.id,
                                                    bike_id: 2,
                                                    subscription_type: 'customer',
                                                    zip_code: 90210
                                                    )

        expect(Trip.rides_for_single_month(["2017-10-01", "2017-10-31"])).to eq(3)
        hash = Trip.rides_per_month
        expect(hash.first[1]).to eq(3)
      end
    end
    describe '.year_totals' do
      it 'should return the total for years' do
        station_3 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_4 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_3.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 1,
                              subscription_type: 'subscriber',
                              zip_code: 80222
                            )
        trip_2 = Trip.create!(duration: 50,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_3.id,
                              bike_id: 2,
                              subscription_type: 'subscriber',
                              zip_code: 90210
                            )
        trip_3 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                            )
        trip_4 = Trip.create!(duration: 55,
                              start_date: Time.parse("2017-11-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2017-11-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                              )
        trip_5 = Trip.create!(duration: 55,
                              start_date: Time.parse("2016-10-29"),
                              start_station_id: station_4.id,
                              end_date: Time.parse("2016-10-29"),
                              end_station_id: station_4.id,
                              bike_id: 2,
                              subscription_type: 'customer',
                              zip_code: 90210
                              )
          expect(Trip.year_totals.values[0]).to eq(1)
          expect(Trip.year_totals.values[1]).to eq(4)
      end
    end
    describe '.conditions_for_busiest_date .conditions_for_least_busy_date' do
      it 'should return conditions for busiest and least busy days' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      trip_1 = Trip.create!(duration: 60,
                            start_date: Date.parse("2014-11-29"),
                            start_station_id: station_1.id,
                            end_date: Date.parse("2017-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 1,
                            subscription_type: 'customer',
                            zip_code: 80222
                          )
      trip_2 = Trip.create!(duration: 50,
                            start_date: Date.parse("2017-11-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2014-11-29"),
                            end_station_id: station_1.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )
      trip_3 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2014-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'subscriber',
                            zip_code: 90210
                          )

      trip_4 = Trip.create!(duration: 55,
                            start_date: Date.parse("2017-10-29"),
                            start_station_id: station_2.id,
                            end_date: Date.parse("2014-10-29"),
                            end_station_id: station_2.id,
                            bike_id: 2,
                            subscription_type: 'customer',
                            zip_code: 90210
                           )
     condition_1 = Condition.create!(date: Date.parse('2017-10-29'),
                                     max_temp: 12.3,
                                     mean_temp: 56.0,
                                     min_temp:1.0,
                                     mean_humidity: 30.0,
                                     mean_visibility: 3.0,
                                     mean_windspeed: 10.0,
                                     precipitation: 2.0
                                   )
     condition_2 = Condition.create!(date: Date.parse('2014-11-29'),
                                     max_temp: 22.1,
                                     mean_temp: 45.0,
                                     min_temp:5.0,
                                     mean_humidity: 70.0,
                                     mean_visibility: 14.0,
                                     mean_windspeed: 12.5,
                                     precipitation: 5.0
                                   )
      expect(Trip.conditions_for_busiest_date).to eq(condition_1)
      expect(Trip.conditions_for_least_busy_date).to eq(condition_2)
      end
    end
end
