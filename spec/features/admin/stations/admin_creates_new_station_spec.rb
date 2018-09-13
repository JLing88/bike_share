require 'rails_helper'

describe 'admin creates new station' do
  @admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

  visit new_admin_station_path

  fill_in :station_name, with: "New_Station"
  fill_in :station_dock_count, with: 12
  fill_in :station_city, with: "New_City"
  fill_in("Installation date", :with => "6/2/2018")
  #how to select date in form 
  # form_for [:admin, @station]


  click_button "Create Station"

  expect(current_path).to eq(admin_station_path(Station.last))
  expect(page).to have_content("New_Station")
  expect(page).to have_content("12")
  expect(page).to have_content("New_City")
  expect(page).to have_content("New_Station")

end
