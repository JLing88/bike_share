class Admin::ConditionsController < Admin::BaseController

  def show
    @condition = Condition.find(params[:id])
  end

  def new
    @condition = Condition.new()
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:success] = "You have successfully added weather data for #{@condition.date}"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Date not propperly added"
      render :new
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(condition_params)
    if @condition.save
      flash[:success] = "You have successfully updated weather for #{@condition.date}"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = 'Condition not propperly updated'
      render :edit
    end
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy

    flash[:success] = "Condition deleted."
    redirect_to conditions_path
  end

  private

    def condition_params
      params.require(:condition).permit(:date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_windspeed, :mean_visibility, :precipitation)
    end

end
