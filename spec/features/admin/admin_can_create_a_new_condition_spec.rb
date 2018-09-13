require 'rails_helper'

describe "User visits condition new" do
  context "as an admin" do
    it "has form to create condition" do

      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_condition_path

      fill_in :condition_date, with: DateTime.parse('2018-05-19')
      fill_in :condition_max_temp, with: 500.00
      fill_in :condition_mean_temp, with: 99.00
      fill_in :condition_min_temp, with: 5.00
      fill_in :condition_mean_visibility, with: 2.00
      fill_in :condition_mean_humidity, with: 10.00
      fill_in :condition_mean_windspeed, with: 5.00
      fill_in :condition_precipitation, with: 6.00

      click_on "Create Condition"

      condition = Condition.find_by(max_temp: 500.00)

      expect(current_path).to eq(admin_condition_path(condition))

      expect(page).to have_content("Maximum Temperature: 500.0")
      expect(page).to have_content("Mean Temperature: 99.0")
      expect(page).to have_content("Minimum Temperature: 5.0")
      expect(page).to have_content("Mean Visibility: 2.0")
      expect(page).to have_content("Mean Humidity: 10.0")
      expect(page).to have_content("Mean Windspeed: 5.0")
      expect(page).to have_content("Precipitation: 6.0")
    end
  end
end
