require 'rails_helper'

describe Trip, type: :model do
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
  end
end
