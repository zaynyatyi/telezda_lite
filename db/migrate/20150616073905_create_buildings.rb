class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.text :name
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
