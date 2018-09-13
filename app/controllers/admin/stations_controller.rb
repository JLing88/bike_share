class Admin::StationsController < Admin::BaseController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find(params[:id])
  end

  def destroy
    station = Station.find(params[:id])
    station.destroy

    flash[:success] = "Station deleted."
    redirect_to admin_stations_path
  end
end
