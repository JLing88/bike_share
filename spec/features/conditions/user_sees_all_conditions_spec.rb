require "rails_helper"

describe 'as a visitor' do
  context 'they visit conditions index' do
    it 'should list all conditions with attributes' do
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
      condition_3 = Condition.create!(date: DateTime.parse('2018-02-09'),
                                      max_temp: 52.0,
                                      mean_temp:37.0,
                                      min_temp:13.0,
                                      mean_humidity: 18.0,
                                      mean_visibility:10.0,
                                      mean_windspeed: 2.0,
                                      precipitation: 3.0
                                    )
      visit conditions_path

      expect(page).to have_link(condition_1.date.strftime("%m-%d-%Y"))
      expect(page).to have_content(condition_1.max_temp)
      expect(page).to have_content(condition_1.mean_temp)
      expect(page).to have_content(condition_1.min_temp)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility)
      expect(page).to have_content(condition_1.mean_windspeed)
      expect(page).to have_content(condition_1.precipitation)

      expect(page).to have_link(condition_2.date.strftime("%m-%d-%Y"))
      expect(page).to have_content(condition_2.max_temp)
      expect(page).to have_content(condition_2.mean_temp)
      expect(page).to have_content(condition_2.min_temp)
      expect(page).to have_content(condition_2.mean_humidity)
      expect(page).to have_content(condition_2.mean_visibility)
      expect(page).to have_content(condition_2.mean_windspeed)
      expect(page).to have_content(condition_2.precipitation)

      expect(page).to have_link(condition_3.date.strftime("%m-%d-%Y"))
      expect(page).to have_content(condition_3.max_temp)
      expect(page).to have_content(condition_3.mean_temp)
      expect(page).to have_content(condition_3.min_temp)
      expect(page).to have_content(condition_3.mean_humidity)
      expect(page).to have_content(condition_3.mean_visibility)
      expect(page).to have_content(condition_3.mean_windspeed)
      expect(page).to have_content(condition_3.precipitation)

    end
  end
end

describe 'as a visitor' do
  context 'they visit conditions index' do
    it 'should list all conditions with attributes' do
      condition_1 = Condition.create!(date: DateTime.parse('2018-8-29'),
                                      max_temp: 12.0,
                                      mean_temp: 55.0,
                                      min_temp:1.0,
                                      mean_humidity: 30.0,
                                      mean_visibility: 3.0,
                                      mean_windspeed: 10.0,
                                      precipitation: 2.0
                                    )
      visit conditions_path

      click_link '08-29-2018'

      expect(current_path).to eq(condition_path(condition_1))

      click_link "<< Back to All Conditions"

      expect(current_path).to eq(conditions_path)
    end
  end
end
