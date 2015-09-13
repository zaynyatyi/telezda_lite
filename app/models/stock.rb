class Stock < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  has_many :items, dependent: :destroy
end
