class CityController < ApplicationController
  include UsersHelper
  before_action "logged_in_user"
  before_action "admin_user",     only: [:index, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    if current_user.mothercity.id != @city.id
      flash[:warning] = "You have to apply citizenship of one of the cities first."
      redirect_to @user
    end
  end

  def apply
    @city = City.find(params[:id])
    @city.accept(current_user)
  end

  private
    def city_params
      params.require(:user).permit(:name)
    end
end
