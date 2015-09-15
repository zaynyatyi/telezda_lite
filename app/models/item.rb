class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock

  validates :name, presence: true, length: { maximum: 50 }
end
