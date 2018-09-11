require 'rails_helper'

describe 'As a registered user' do
  context 'they can visit the /stations_dashboard' do
    it 'they see a total count of all Stations' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path

      expect(page).to have_content("Total Stations: #{Station.count}")
    end

    it 'they see average bikes per station' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path

      expect(page).to have_content("Average Bike Count Per Station: #{Station.average(:dock_count)}")
    end

    it 'they see the station with most available bikes' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path
      expect(page).to have_content("#{station_3.name} has #{station_3.dock_count} bikes available.")
    end
  end
end
