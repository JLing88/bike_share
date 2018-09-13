class Admin::TripsController < Admin::BaseController
  def index
    @trips = Trip.page(params[:page]).per(30)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Trip #{@trip.id} has been destroyed!"
    redirect_to trips_path
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(admin_trip_params)
    if @trip.save
      flash[:success] = "You have successfully updated trip #{@trip.id}"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = 'Trip not properly updated'
      render :edit
    end
  end

  private

  def admin_trip_params
    params.require(:trip).permit(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code)
  end
end
