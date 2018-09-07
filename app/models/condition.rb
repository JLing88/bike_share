class Condition < ApplicationRecord
  validates_presence_of :date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_visibility, :mean_windspeed, :precipitation
end
