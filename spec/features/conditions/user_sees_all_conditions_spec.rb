require "rails_helper"

describe 'as a visitor' do
  context 'they visit conditions index' do
    it 'should list all conditions with attributes' do
      condition_1 = Condition.create!(:date, DateTime.parse('2018-8-29')
                                      :max_temp,
                                      :mean_temp,
                                      :min_temp,
                                      :mean_humidity,
                                      :mean_visibility,
                                      :mean_windspeed,
                                      :precipitation
                                    )
    end)
