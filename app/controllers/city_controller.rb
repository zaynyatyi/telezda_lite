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
    current_user.place = "yard"
  end

  def tower
    current_user.place = "tower"
    current_user.save
    @users = User.where(place: "tower")
  end

  def room
    current_user.place = "room"
  end

  def hydroponics
    current_user.place = "hydroponics"
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
