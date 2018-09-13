class Admin::StationsController < Admin::BaseController

  def show
    @station = Station.find(params[:id])
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.create(station_params)
    if @station.save
      flash[:notice] = "You created #{@station.name} Station"
      redirect_to station_path(@station)
    else
      render :new
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.update(station_params)
    if @station.save
      flash[:success] = "You updated #{@station.name} Station"
      redirect_to station_path(@station)
    else
      flash[:notice] = 'Station not updated'
      render :edit
    end
  end

  def destroy
    station = Station.find(params[:id])
    station.destroy

    flash[:success] = "Station deleted."
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :dock_count, :city, :installation_date)
  end
end
