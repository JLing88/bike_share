class TripsController < ApplicationController
  def index
    @trips = Trip.page(params[:page]).per(30)
  end

  def show
    @trip = Trip.find(params[:id])
  end

end
