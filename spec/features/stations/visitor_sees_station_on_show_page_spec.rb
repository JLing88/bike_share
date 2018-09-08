require 'rails_helper'

describe 'as a visitor' do
  context 'they visit station show page' do
    it 'should shows the name in the uri' do
      station = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit "/stations/#{station.name}"

      expect(current_path).to eq(station_path(station.name))

    end

    it 'should show all attributes for the station' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit "/stations/#{station_1.name}"

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
    end
  end
end
