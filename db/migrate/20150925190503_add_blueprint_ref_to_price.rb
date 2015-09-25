class AddBlueprintRefToPrice < ActiveRecord::Migration
  def change
    add_reference :prices, :blueprint, index: true, foreign_key: true
  end
end
