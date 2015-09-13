class City < ActiveRecord::Base
  has_many :citizenships, class_name:  "Citizenship",
                                  foreign_key: "city_id",
                                  dependent:   :destroy
  has_many :citizens, through: :citizenships, source: :citizen
  has_one :stock
  validates :name, presence: true, length: { maximum: 50 }

  # Follows a user.
  def accept(user)
    citizenships.create(citizen_id: user.id)
  end

  # Unfollows a user.
  def decline(user)
    citizenships.find_by(citizen_id: user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def citizen?(user)
    citizens.include?(user)
  end
end
