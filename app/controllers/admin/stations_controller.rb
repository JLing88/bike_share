class Admin::StationsController < Admin::BaseController
  def index
    @stations = Station.all
  end
end
