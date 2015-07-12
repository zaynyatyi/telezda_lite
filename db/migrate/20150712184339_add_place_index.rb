class AddPlaceIndex < ActiveRecord::Migration
  def change
    add_index :users, :place
  end
end
