class TripsDashboardController < ApplicationController

  def show
    @avg_duration = Trip.avg_ride_duration
    @longest_trip = Trip.longest_trip
    @shortest_trip = Trip.shortest_trip
  end
end
