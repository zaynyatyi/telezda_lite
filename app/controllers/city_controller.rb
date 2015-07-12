class CityController < ApplicationController
  include UsersHelper
  before_action "logged_in_user"
  before_action "admin_user", only: [:index, :edit, :update, :destroy]
  before_action :init_places_list, only: [:show, :yard, :room, :tower, :hydroponics]

  def index
    @cities = City.all
  end

  def show
    if current_user.mothercity.id != @city.id
      flash[:warning] = "You have to apply citizenship of one of the cities first."
      redirect_to @user
    end
  end

  def apply
    @city = City.find(params[:id])
    @city.accept(current_user)
  end

  def yard

  end

  def tower

  end

  def room

  end

  def hydroponics

  end

  private
    def city_params
      params.require(:user).permit(:name)
    end

    def init_places_list
      @city = City.find(params[:id])
      @places = [
        {name: "Yard", action: "yard"},
        {name: "Watch Tower", action: "tower"},
        {name: "Room", action: "room"},
        {name: "Hydroponics", action: "hydroponics"}
      ]
    end
end
