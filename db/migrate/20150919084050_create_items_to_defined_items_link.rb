class CreateItemsToDefinedItemsLink < ActiveRecord::Migration
  def change
    create_table :item_descriptions do |t|
      t.integer :item_id
      t.integer :defined_item_id

      t.timestamps null: false
    end
    add_index :item_descriptions, :item_id
    add_index :item_descriptions, :defined_item_id
    add_index :item_descriptions, [:item_id, :defined_item_id], unique: true
  end
end
