class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      redirect_to dashboard_path
    else
      flash[:notice] = "Username already taken"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "Information Updated"
      redirect_to dashboard_path
    else
      flash[:notice] = "Error!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :last_name, :first_name, :address)
  end
end
