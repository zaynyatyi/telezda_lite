class CreateBuildingDescriptions < ActiveRecord::Migration
  def change
    create_table :defined_buildings do |t|
      t.string :name, limit: 30

      t.timestamps null: false
    end
    add_index :defined_buildings, :name, unique: true

    create_table :building_descriptions do |t|
      t.integer :building_id
      t.integer :defined_building_id

      t.timestamps null: false
    end
    add_index :building_descriptions, :building_id, name: 'building_index'
    add_index :building_descriptions, :defined_building_id, name: 'building_defined_index'
    add_index :building_descriptions, [:building_id, :defined_building_id], unique: true, name: 'building_description_index'
  end
end
