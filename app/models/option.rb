class Option < ApplicationRecord
    has_many :option_items
    has_many :food_items, through: :option_items
    has_and_belongs_to_many :group_items
end
