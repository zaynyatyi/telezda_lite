class Citizenship < ActiveRecord::Base
  belongs_to :city, class_name: "City"
  belongs_to :citizen, class_name: "User"
  validates :city_id, presence: true
  validates :citizen_id, presence: true
end
