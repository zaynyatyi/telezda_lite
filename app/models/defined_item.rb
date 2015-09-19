class DefinedItem < ActiveRecord::Base
  has_many :item, class_name: "ItemDescription",
                  foreign_key: "defined_item_id",
                  dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { case_sensitive: false }
end
