class StationsController < ApplicationController
  before_action :require_user, only: [:show]

  def index
    @stations = Station.all
  end

  def show
    @station = Station.friendly.find(params[:id])
  end
end
