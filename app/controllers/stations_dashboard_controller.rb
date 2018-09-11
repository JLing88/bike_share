class StationsDashboardController < ApplicationController
  def show
    @stations = Station.all
    @avg_bike_count = Station.avg_bike_count
    @top_dock_count = Station.maximum(:dock_count)
    @top_bike_station = Station.where(dock_count: @top_dock_count)[0]
  end
end
