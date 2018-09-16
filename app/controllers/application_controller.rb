class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :require_user
  helper_method :current_admin?
  helper_method :validate_user_resource?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def validate_user_resource?
    order = Order.find(params[:id])
    current_user == order.user || current_admin?
  end

  def cart
    @cart ||= Cart.new(session[:cart])
  end

end
