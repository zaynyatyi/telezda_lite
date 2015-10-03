class ConstructionKit < ActiveRecord::Base
  belongs_to :city
  belongs_to :blueprint
end
