class RemoveNameFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :name, :string
  end
end
