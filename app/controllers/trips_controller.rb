class TripsController < ApplicationController
  def index
    @trips = Trip.page(params[:page]).per(30)
  end
end
