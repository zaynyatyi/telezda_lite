class RemoveDefinedItemRefFromItem < ActiveRecord::Migration
  def change
    remove_reference :items, :defined_item, index: true, foreign_key: true
  end
end
