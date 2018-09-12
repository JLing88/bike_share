class Admin::TripsController < Admin::BaseController
  def index
    @trips = Trip.page(params[:page]).per(30)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to admin_trips_path
  end
end
