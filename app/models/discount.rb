class Discount < ApplicationRecord
    enum post_status: { available: 1,  unavailable: 2 }

    has_and_belongs_to_many :food_items
    has_many :discount_timings
end
