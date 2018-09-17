class Trip < ApplicationRecord
  belongs_to :start_station, class_name: 'Station'
  belongs_to :end_station, class_name: 'Station'

  validates_presence_of :duration,
                        :start_date,
                        :start_station_id,
                        :end_date,
                        :end_station_id,
                        :bike_id,
                        :subscription_type

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
    var = Station.joins("join trips on stations.id = trips.start_station_id")
                 .order("count_all desc")
                 .limit(1)
                 .group(:id)
                 .count
    Station.find(var.keys.first)
  end

  def self.most_ending_trips
    var = Station.joins("join trips on stations.id = trips.end_station_id")
                  .order("count_all asc")
                  .limit(1)
                  .group(:id)
                  .count
    Station.find(var.keys.first)
  end

  def self.most_ridden_bike
    select('trips.bike_id, count(bike_id) as count').group(:bike_id).order('count desc').first.bike_id
  end

  def self.least_ridden_bike
    select('trips.bike_id, count(bike_id) as count').group(:bike_id).order('count asc').first.bike_id
  end

  def self.total_rides_for_bike(bike_id)
    Trip.where(bike_id: bike_id).count
  end

  def self.busiest_day
    select('trips.start_date, count(start_date) as count').group(:start_date).order('count desc').first.start_date.to_s

  end

  def self.least_busy_day
    select('trips.start_date, count(start_date) as count').group(:start_date).order('count asc').first.start_date.to_s
  end

  def self.total_trips_for_date(date)
    Trip.where(start_date: date).count
  end

  def self.total_trips
    Trip.count
  end

  def self.subscription_count
    Trip.where(subscription_type: 'subscriber').count
  end

  def self.customer_count
    Trip.where(subscription_type: 'customer').count
  end

  def self.percentage_subscribers
    ((subscription_count.to_f) / (total_trips.to_f)) * 100
  end

  def self.percentage_customers
    ((customer_count.to_f) / (total_trips.to_f)) * 100
  end

  def self.rides_for_single_month(dates)
    var = Trip.where('start_date between ? and ?', Time.parse(dates[0]), Time.parse(dates[1])).count
  end

  def self.rides_per_month
    var  = Trip.group("DATE_TRUNC('month', start_date)").count
    return var
  end

  def self.year_totals
    var = Trip.group("DATE_TRUNC('year', start_date)").count
  end


end
