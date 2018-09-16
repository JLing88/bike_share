class Station < ApplicationRecord
  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id", dependent: :destroy
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id", dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]
  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.avg_bike_count
    Station.average(:dock_count)
  end

  def number_start_trips(station)
    Trip.where(start_station_id: station.id).count
  end

  def number_end_trips(station)
    Trip.where(end_station_id: station.id).count
  end

  def most_freq_destination(station)
    #most frequent destination FROM this Station

  end

end
