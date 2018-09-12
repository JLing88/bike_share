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
    it {should validate_presence_of :zip_code}
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
      it 'returns the bike with the most trips' do
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
                              end_station_id: station_4.id,                    bike_id: 2,
                              subscription_type: 'stolen',
                              zip_code: 90210
                              )

        expect(Trip.most_ridden_bike).to eq(2)
      end
    end
  end
end
