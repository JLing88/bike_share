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

  describe '.avg_bike_count' do
    it 'returns average bike count for all stations' do
      station_1 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)

      expect(Station.avg_bike_count).to eq(15)
    end
end
    describe '.most_starting_trips' do
      it 'returns the station with the most rides as a starting point' do
        station_1 = Station.create!(name: 'Wads', dock_count: 20, city: 'Lakewood', installation_date: Time.now)
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
      expect(Trip.most_starting_trips).to eq(station_2)
    end
  end
end
