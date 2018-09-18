class Admin::DashboardsController < Admin::BaseController
  def index
    @orders = Order.all
  end
end
