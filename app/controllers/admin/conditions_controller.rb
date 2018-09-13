class Admin::ConditionsController < Admin::BaseController
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

  private

    def condition_params
      params.require(:condition).permit(:date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_windspeed, :mean_visibility, :precipitation)
    end

end
