require "rails_helper"

describe 'as a visitor' do
  context 'they visit condition show' do
    it 'should list all attributes for one condition' do
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

      visit(condition_path(condition_1))

      expect(page).to have_content("Date: #{condition_1.date}")
      expect(page).to have_content("Maximum Temperature: #{condition_1.max_temp}")
      expect(page).to have_content("Mean Temperature: #{condition_1.mean_temp}")
      expect(page).to have_content("Minimum Temperature: #{condition_1.min_temp}")
      expect(page).to have_content("Mean Humidity: #{condition_1.mean_humidity}")
      expect(page).to have_content("Mean Visibility: #{condition_1.mean_visibility}")
      expect(page).to have_content("Mean Windspeed: #{condition_1.mean_windspeed}")
      expect(page).to have_content("Precipitation: #{condition_1.precipitation}")

      expect(page).to_not have_content("Date: #{condition_2.date}")
      expect(page).to_not have_content("Maximum Temperature: #{condition_2.max_temp}")
      expect(page).to_not have_content("Mean Temperature: #{condition_2.mean_temp}")
      expect(page).to_not have_content("Minimum Temperature: #{condition_2.min_temp}")
      expect(page).to_not have_content("Mean Humidity: #{condition_2.mean_humidity}")
      expect(page).to_not have_content("Mean Visibility: #{condition_2.mean_visibility}")
      expect(page).to_not have_content("Mean Windspeed: #{condition_2.mean_windspeed}")
      expect(page).to_not have_content("Precipitation: #{condition_2.precipitation}")

    end
  end
end
