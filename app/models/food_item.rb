class FoodItem < ApplicationRecord
    has_many :option_items
    has_many :options, through: :option_items
end
