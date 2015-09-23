class UsersController < ApplicationController
  include UsersHelper
  before_action "logged_in_user", only: [:edit, :update, :destroy]
  before_action "correct_user",   only: [:edit, :update]
  before_action "admin_user",     only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @cities = City.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def reply_where
    WebsocketRails["binder"].trigger("rebind", { new_room: current_user.place })
  end

  def get_user_items
    respond_to do |format|
      prepare_items_list()
      format.js {}
    end
  end

  def craft_item
    items_ids = []
    for index in 0..2
       items_ids.push(params['item_%d_id' % index]);
    end
    craft_allowed = true;
    items = []
    for item_id in items_ids
      item = Item.find(item_id)
      if (item.user != current_user)
        craft_allowed = false
        break;
      else
        items.push(item)
      end
    end
    if craft_allowed
      recipe = Recipe.find_by item_1: items[0].description.id, item_2: items[1].description.id, item_3: items[2].description.id
      if recipe != nil
        @completed = "Yes"
        @recipe = recipe
        crafted_result_type = recipe.item_result.id
        crafted_item = Item.new
        crafted_item.description = DefinedItem.find(recipe.item_result.id)
        crafted_item.user = current_user
        crafted_item.save()
        for item_id in items_ids
          Item.destroy(item_id)
        end
        flash[:success] = "Crafted %s" % crafted_item.description.name
      else
        flash[:warning] = "Recipe not found"
      end
    else
      flash[:warning] = "Craft not allowed. Maybe you don't have needed items"
    end
    prepare_items_list()
    respond_to do |format|
      format.js {}
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def prepare_items_list
      user_items = Item.where(user: current_user)
      @user_items_names = []
      @city_id = current_user.mothercity.id
      if user_items != nil
        for user_item in user_items do
          @user_items_names.push({ name: user_item.description.name, id: user_item.id })
        end
      end
    end
end
