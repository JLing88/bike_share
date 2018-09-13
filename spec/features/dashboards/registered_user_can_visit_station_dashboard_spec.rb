require 'rails_helper'

describe 'As a registered user' do
  context 'they can visit the /stations_dashboard' do
    it 'they see a total count of all Stations' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path

      expect(page).to have_content("Total Stations: #{Station.count}")
    end

    it 'they see average bikes per station' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path
      expect(page).to have_content("Average Bike Count Per Station: #{Station.average(:dock_count)}")
    end

    it 'they see the station with most available bikes' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path
      expect(page).to have_content("#{station_3.name} has #{station_3.dock_count} bikes available.")
    end

    it 'they see the station with least available bikes' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_dashboard_path
      expect(page).to have_content("#{station_2.name} has #{station_2.dock_count} bikes available.")
    end

    it 'they see the most recently installed station' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Date.parse("2010-10-31"))
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Date.parse("2020-10-31"))

      visit stations_dashboard_path

      expect(page).to have_content("Newest Station: #{station_1.name}")
    end

    it 'they see the most recently installed station' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Date.parse("2010-10-31"))
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Date.parse("2020-10-31"))

      visit stations_dashboard_path

      expect(page).to have_content("Oldest Station: #{station_4.name}")
    end
  end
end
