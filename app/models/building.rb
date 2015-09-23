class Building < ActiveRecord::Base
  has_one :building_description, foreign_key: "building_id", dependent: :destroy
  has_one :description, through: :building_description, source: :defined_building
  belongs_to :city
end
