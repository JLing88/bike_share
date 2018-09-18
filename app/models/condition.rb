class Condition < ApplicationRecord
  validates_presence_of :date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_visibility, :mean_windspeed, :precipitation

  def self.number_rides_per_condition_type(condition_type, low, high)
    Trip.select("start_date, count(trips.id)")
        .joins("join conditions ON conditions.date = trips.start_date")
        .where("#{condition_type} between ? AND ?", low, high)
        .group(:start_date)
        .order('count(trips.id) DESC')
        .limit(1)
        .count(:id)
  end

end
