require 'rails_helper'

describe Station, type: :model do
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
end
