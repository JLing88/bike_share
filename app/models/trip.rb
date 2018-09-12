class Trip < ApplicationRecord
  belongs_to :start_station, class_name: 'Station'
  belongs_to :end_station, class_name: 'Station'

  validates_presence_of :duration,
                        :start_date,
                        :start_station_id,
                        :end_date,
                        :end_station_id,
                        :bike_id,
                        :subscription_type,
                        :zip_code

  def start_station_name(trip)
    Station.find(trip.start_station_id).name
  end

  def end_station_name(trip)
    Station.find(trip.end_station_id).name
  end

  def self.avg_ride_duration
    Trip.average(:duration)
  end

  def self.longest_trip
    Trip.where(duration: Trip.maximum(:duration)).limit(1).first
  end

  def self.shortest_trip
    Trip.where(duration: Trip.minimum(:duration)).limit(1).first
  end

  def self.most_starting_trips
  var =   Station.joins("join trips on stations.id = trips.start_station_id")
    .order("count_all desc")
    .limit(1)
    .group(:id)
    .count
    Station.find(var.values.first)
  end
end
