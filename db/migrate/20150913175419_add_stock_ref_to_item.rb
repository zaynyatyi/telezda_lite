class AddStockRefToItem < ActiveRecord::Migration
  def change
    add_reference :items, :stock, index: true, foreign_key: true
  end
end
