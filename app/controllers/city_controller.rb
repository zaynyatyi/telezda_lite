class CityController < ApplicationController
  include UsersHelper
  before_action "logged_in_user"
  before_action "admin_user", only: [:index, :edit, :update, :destroy]
  before_action :init_places_list, only: [:show, :yard, :room, :tower, :hydroponics]
  before_action :assign_current_place, only: [:yard, :room, :tower, :hydroponics]

  def index
    @cities = City.all
  end

  def show
    if current_user.mothercity.id != @city.id
      flash[:warning] = "You have to apply citizenship of one of the cities first."
      redirect_to @user
    else
      render 'yard'
    end
  end

  def apply
    @city = City.find(params[:id])
    @city.accept(current_user)
  end

  def yard
  end

  def tower
    current_user.save
    @users = User.where(place: "tower")
    WebsocketRails[:stalkers].trigger 'entered', current_user.name
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

    def assign_current_place
      current_user.place = action_name
    end
end
