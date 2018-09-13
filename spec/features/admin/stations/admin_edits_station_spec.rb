require 'rails_helper'

describe 'user edit station' do
  context 'as an admin' do
    it 'shows edited station on station index' do
      station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)

      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_station_path(station_1)

      fill_in :station_name, with: "Edited_Station"
      fill_in :station_dock_count, with: 12
      fill_in :station_city, with: "Edited_City"
      fill_in("Installation date", :with => "6/2/2018")

      click_button "Update Station"

      expect(current_path).to eq(station_path(Station.last))
      expect(page).to have_content("Edited_Station")
      expect(page).to have_content("12")
      expect(page).to have_content("Edited_City")
      expect(page).to have_content("2018-02-06")
      expect(page).to have_content("You updated #{Station.last.name} Station")
    end
  end
end
