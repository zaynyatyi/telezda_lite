class ItemDescription < ActiveRecord::Base
  belongs_to :item, class_name: "Item"
  belongs_to :defined_item, class_name: "DefinedItem"
  validates :item_id, presence: true
  validates :defined_item_id, presence: true
end
