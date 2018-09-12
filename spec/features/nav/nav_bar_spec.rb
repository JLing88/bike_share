require 'rails_helper'

describe 'A user can interact with the nav bar' do
  describe 'user clicks on Bike-Share' do
    it 'nav bar links functionality' do

      visit root_path

      click_on("BikeShare")

      expect(current_path).to eq(root_path)

      click_on("Stations")

      expect(current_path).to eq(stations_path)

      click_on("Trips")

      expect(current_path).to eq(trips_path)

      click_on("Conditions")

      expect(current_path).to eq(conditions_path)

      click_on("Accessories")

      expect(current_path).to eq(bike_store_path)
    end
  end
end
