class Recipe < ActiveRecord::Base
  belongs_to :item_1, :class_name => "DefinedItem"
  belongs_to :item_2, :class_name => "DefinedItem"
  belongs_to :item_3, :class_name => "DefinedItem"
  belongs_to :item_result, :class_name => "DefinedItem"
end
