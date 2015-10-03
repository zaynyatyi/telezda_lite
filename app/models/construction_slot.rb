class ConstructionSlot < ActiveRecord::Base
  belongs_to :defined_item
  belongs_to :construction_kit
end
