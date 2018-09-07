require 'rails_helper'

describe 'as a visitor' do
  context 'they visit station show page' do
    it 'should shows the name in the uri' do
      station = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit "/stations/#{station.name}"

      expect(current_path).to eq(station_path(station.name))

    end
  end
end
