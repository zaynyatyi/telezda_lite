class BuildingDescription < ActiveRecord::Base
  belongs_to :building, class_name: "Building"
  belongs_to :defined_building, class_name: "DefinedBuilding"
  validates :building_id, presence: true
  validates :defined_building_id, presence: true
end
