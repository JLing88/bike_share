class StationsController < ApplicationController

  def index
    @stations = Station.page(params[:page]).per(30)
  end

  def show
    @station = Station.friendly.find(params[:id])
  end
end
