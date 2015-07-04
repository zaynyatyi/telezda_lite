class CityController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :admin_user,     only: [:edit, :update, :destroy]
  
  def index
    @cities = City.all
  end
  
  def show
    @cities = City.all
    @city = City.find(params[:id])
  end
  
  private
    def city_params
      params.require(:user).permit(:name)
    end
    
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
