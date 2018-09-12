class StationsDashboardController < ApplicationController
  before_action :require_user
  def show
    @stations = Station.all
    @avg_bike_count = Station.avg_bike_count
    @top_dock_count = Station.maximum(:dock_count)
    @top_bike_station = Station.where(dock_count: @top_dock_count)[0]
    @low_dock_count = Station.minimum(:dock_count)
    @low_bike_station = Station.where(dock_count: @low_dock_count)[0]
    @newest_station = Station.order(:installation_date).first
    @oldest_station = Station.order(:installation_date).last
  end
end
