class FoodItem < ApplicationRecord
    has_many :option_items
    has_many :options, through: :option_items
    has_and_belongs_to_many :discounts
    has_many :deal_items,as: :deal_itemable
end
