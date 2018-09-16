require 'rails_helper'

describe Station, type: :model do

  describe 'relationships' do
   it { is_expected.to have_many(:start_trips) }
   it { is_expected.to have_many(:end_trips) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :dock_count}
    it {should validate_presence_of :city}
    it {should validate_presence_of :installation_date}
  end

  describe 'class methods' do
    describe '.avg_bike_count' do
      it 'returns average bike count for all stations' do
        station_1 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
        station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)

        expect(Station.avg_bike_count).to eq(15)
      end
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
    end

    it 'returns the station with the most rides as an ending point' do
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
      expect(Trip.most_ending_trips).to eq(station_3)
    end
  end

  describe 'instance methods' do
    describe '#number_start_trips' do
      it 'returns number of Trips(in spec, rides) started at that Station' do
        station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
        station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
        trip_2 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 7, subscription_type: 'monthly', zip_code: 80333)
        trip_3 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 12, subscription_type: 'monthly', zip_code: 80444)

        expect(station_1.number_start_trips(station_1)).to eq(2)
      end
    end

    describe '#number_end_trips' do
      it 'returns number of Trips(in spec, rides) ended at that Station' do
        station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
        station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
        trip_2 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 7, subscription_type: 'monthly', zip_code: 80333)
        trip_3 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_2.id, end_date: Time.now, end_station_id: station_1.id, bike_id: 12, subscription_type: 'monthly', zip_code: 80444)

        expect(station_1.number_end_trips(station_1)).to eq(1)
      end
    end

    describe '#most_freq_destination' do
      xit 'returns most frequent destination station from that start station' do
        station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
        station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
        station_3 = Station.create!(name: 'Baker', dock_count: 5, city: 'Denver', installation_date: Time.now)
        trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_3.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)
        trip_2 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 7, subscription_type: 'monthly', zip_code: 80333)
        trip_3 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 12, subscription_type: 'monthly', zip_code: 80444)
        trip_4 = Trip.create!(duration: 50, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_3.id, bike_id: 15, subscription_type: 'monthly', zip_code: 80555)

        expect(station_1.most_freq_destination(station_1)).to eq(station_2.name)
      end
    end
  end
end
