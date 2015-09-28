class ItemController < ApplicationController
  include ItemHelper
  include SessionsHelper
  def push_to_city_stock
    item = Item.find(params[:item_id])
    stock = City.find(params[:city_id]).stock
    if (item != nil && stock != nil)
      if item.user == current_user
        item.stock = stock
        item.user = nil
        item.save()
        notify_items_in_stock_changed(stock, params[:city_id])
        respond_to do |format|
          prepare_user_items(params[:city_id])
          format.js {}
        end
      end
    end
  end

  def pop_from_city_stock
    item = Item.find(params[:item_id])
    stock = City.find(params[:city_id]).stock
    if (item != nil && stock != nil)
      if item.stock == stock
        item.stock = nil
        item.user = current_user
        item.save()
        notify_items_in_stock_changed(stock, params[:city_id])
        respond_to do |format|
          prepare_user_items(params[:city_id])
          format.js {}
        end
      end
    end
  end

  private
    def notify_items_in_stock_changed(city_stock, city_id)
      group_stock_items(city_stock)
      stock_items_names = []

      for stock_item in @grouped_stock_items.keys do
        stock_items_names.push({ name: stock_item, id: @grouped_stock_items[stock_item][:id], amount: @grouped_stock_items[stock_item][:amount] })
      end
      WebsocketRails["items"].trigger("items_list_changed", {:city_id => city_id, :stock_items => stock_items_names})
    end

    def prepare_user_items(city_id)
      user_items = Item.where(user: current_user)
      @user_items_names = []
      @city_id = city_id
      if user_items != nil
        for user_item in user_items do
          @user_items_names.push({ name: user_item.description.name, id: user_item.id })
        end
      end
    end

end
