class CreateDefinedItems < ActiveRecord::Migration
  def change
    create_table :defined_items do |t|
      t.string :name, limit: 30

      t.timestamps null: false
    end
    add_index :defined_items, :name, unique: true
  end
end
