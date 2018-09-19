class Admin::DashboardsController < Admin::BaseController
  def index
    @orders = Order.all
    @sorted_orders = Order.by_status
  end
end
