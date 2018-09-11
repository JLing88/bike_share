class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]
  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.avg_bike_count
    Station.average(:dock_count)
  end
end
