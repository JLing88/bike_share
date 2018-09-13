require 'rails_helper'

describe "User visits conditions edit" do
  context "as an admin" do
    it "has form to update condition" do
      condition_1 = Condition.create!(date: DateTime.parse('2018-8-29'),
                                      max_temp: 12.0,
                                      mean_temp: 55.0,
                                      min_temp:1.0,
                                      mean_humidity: 30.0,
                                      mean_visibility: 3.0,
                                      mean_windspeed: 10.0,
                                      precipitation: 2.0
                                    )
      condition_2 = Condition.create!(date: DateTime.parse('2018-05-19'),
                                      max_temp: 22.0,
                                      mean_temp: 45.0,
                                      min_temp:5.0,
                                      mean_humidity: 70.0,
                                      mean_visibility: 14.0,
                                      mean_windspeed: 12.0,
                                      precipitation: 5.0
                                    )

      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_condition_path(condition_2)
      save_and_open_page
      fill_in :condition_date, with: DateTime.parse('2018-05-19')
      fill_in :condition_max_temp, with: 500.00
      fill_in :condition_mean_temp, with: 99.00
      fill_in :condition_min_temp, with: 5.00
      fill_in :condition_mean_visibility, with: 2.00
      fill_in :condition_mean_windspeed, with: 5.00
      fill_in :condition_precipitation, with: 6.00

      click_on "Update Condition"
      save_and_open_page
      expect(current_path).to eq(condition_path(condition_2))
      expect(page).to have_content("Maximum Temperature: 500.0")
      expect(page).to have_content("Mean Temperature: 99.0")
      expect(page).to have_content("Minimum Temperature: 5.0")
      expect(page).to have_content("Mean Visibility: 2.0")
      expect(page).to have_content("Mean Windspeed: 5.0")
      expect(page).to have_content("Precipitation: 6.0")
    end
  end
end
