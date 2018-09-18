class ConditionsController < ApplicationController


  def index
    @conditions = Condition.page(params[:page]).per(30)
  end

  def show
    @condition = Condition.find(params[:id])
  end

end
