class AddDefinedItemRefToItem < ActiveRecord::Migration
  def change
    add_reference :items, :defined_item, index: true, foreign_key: true
  end
end
