class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :defined_item, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
