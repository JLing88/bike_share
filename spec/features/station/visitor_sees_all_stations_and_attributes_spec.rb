require 'rails_helper'

describe 'as a visitor' do
  context 'they visit stations index' do
    it 'should list each station and associated attributes' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
      station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
      station_3 = Station.create!(name: 'Ward', dock_count: 25, city: 'Arvada', installation_date: Time.now)
      station_4 = Station.create!(name: 'Union', dock_count: 20, city: 'Denver', installation_date: Time.now)

      visit stations_path
save_and_open_page
      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
    end
  end
end
