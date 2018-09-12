class Station < ApplicationRecord
  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id", dependent: :destroy
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id", dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]
  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.avg_bike_count
    Station.average(:dock_count)
  end

end
