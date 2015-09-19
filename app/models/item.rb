class Item < ActiveRecord::Base
  has_one :item_description, foreign_key: "item_id", dependent: :destroy
  has_one :description, through: :item_description, source: :defined_item
  belongs_to :user
  belongs_to :stock
end
