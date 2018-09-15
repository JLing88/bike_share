class DashboardController < ApplicationController

  def show
    @user = current_user
    @user_orders = Order.where(user_id: @user.id)
  end

end
