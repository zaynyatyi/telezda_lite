class Blueprint < ActiveRecord::Base
  belongs_to :defined_building
  has_many :price
  has_many :building_dependency
end
