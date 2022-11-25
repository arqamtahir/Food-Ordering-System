class Option < ApplicationRecord
    has_many :option_items
    has_many :food_items, through: :option_items
    belongs_to :group_item
end
