class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :item_1_id
      t.integer :item_2_id
      t.integer :item_3_id
      t.integer :item_result_id

      t.timestamps null: false
    end
    add_foreign_key :recipes, :defined_items, column: :item_1_id
    add_foreign_key :recipes, :defined_items, column: :item_2_id
    add_foreign_key :recipes, :defined_items, column: :item_3_id
    add_foreign_key :recipes, :defined_items, column: :item_result_id
  end
end
