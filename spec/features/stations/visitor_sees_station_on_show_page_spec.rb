require 'rails_helper'

describe 'as a visitor' do
  context 'they visit station show page' do
    it 'should shows the name in the uri' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit station_path(station)

      expect(current_path).to eq(station_path(station.slug))

    end

    it 'should show all attributes for the station' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      visit station_path(station_1)

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
    end
  end
end
