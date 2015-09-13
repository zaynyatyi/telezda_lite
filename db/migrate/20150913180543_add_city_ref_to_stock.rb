class AddCityRefToStock < ActiveRecord::Migration
  def change
    add_reference :stocks, :city, index: true, foreign_key: true
  end
end
