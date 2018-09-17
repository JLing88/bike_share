class TripsDashboardController < ApplicationController

  before_action :require_user

  def show
    @avg_duration = Trip.avg_ride_duration
    @longest_trip = Trip.longest_trip
    @shortest_trip = Trip.shortest_trip
    @most_started_station = Trip.most_starting_trips
    @most_ended_station = Trip.most_ending_trips
  end
end
