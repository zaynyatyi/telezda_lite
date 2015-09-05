class AddIsStakerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_stalker, :boolean
  end
end
