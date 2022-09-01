class Discount < ApplicationRecord
    has_and_belongs_to_many :food_items
    has_many :discount_timings
end
