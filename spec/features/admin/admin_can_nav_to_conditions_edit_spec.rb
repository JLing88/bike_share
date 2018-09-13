require 'rails_helper'

describe "User visits conditions index" do
  context "as an admin" do
    it "has links to edit condition" do
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

      visit conditions_path

      first(:link, "Edit").click

      expect(current_path).to eq(edit_admin_condition_path(condition_1))
    end
  end
end
