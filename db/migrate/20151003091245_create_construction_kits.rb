class CreateConstructionKits < ActiveRecord::Migration
  def change
    create_table :construction_kits do |t|
      t.references :city, index: true, foreign_key: true
      t.references :blueprint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
