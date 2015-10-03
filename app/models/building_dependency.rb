class BuildingDependency < ActiveRecord::Base
  belongs_to :defined_building
  belongs_to :blueprint
end
