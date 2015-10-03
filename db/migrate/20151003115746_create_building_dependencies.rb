class CreateBuildingDependencies < ActiveRecord::Migration
  def change
    create_table :building_dependencies do |t|
      t.references :defined_building, index: true, foreign_key: true
      t.references :blueprint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
