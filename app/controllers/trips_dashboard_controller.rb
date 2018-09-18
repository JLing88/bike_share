class TripsDashboardController < ApplicationController

  before_action :require_user

  def show
    @avg_duration = Trip.avg_ride_duration
    @longest_trip = Trip.longest_trip
    @shortest_trip = Trip.shortest_trip
    @most_started_station = Trip.most_starting_trips
    @most_ended_station = Trip.most_ending_trips
    @most_ridden_bike = Trip.most_ridden_bike
    @least_ridden_bike = Trip.least_ridden_bike
    @subscription_count = Trip.subscription_count
    @customer_count = Trip.customer_count
    @subscription_percentage = Trip.percentage_subscribers
    @customer_percentage = Trip.percentage_customers
    @busiest_day = Trip.busiest_day
    @least_busy_day = Trip.least_busy_day
    @monthly_break_down = Trip.rides_per_month
    @yearly_breakdown = Trip.year_totals
    @busiest_condition = Trip.conditions_for_busiest_date
    @least_busy_condition = Trip.conditions_for_least_busy_date
  end
end
