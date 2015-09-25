class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.references :defined_building, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
