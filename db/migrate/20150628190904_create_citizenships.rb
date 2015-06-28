class CreateCitizenships < ActiveRecord::Migration
  def change
    create_table :citizenships do |t|
      t.integer :city_id
      t.integer :citizen_id

      t.timestamps null: false
    end
    add_index :citizenships, :city_id
    add_index :citizenships, :citizen_id
    add_index :citizenships, [:city_id, :citizen_id], unique: true
  end
end
