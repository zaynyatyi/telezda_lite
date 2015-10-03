class CreateConstructionSlots < ActiveRecord::Migration
  def change
    create_table :construction_slots do |t|
      t.references :defined_item, index: true, foreign_key: true
      t.integer :amount
      t.references :construction_kit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
