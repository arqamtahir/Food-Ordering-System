class Discount < ApplicationRecord
    include Discard::Model
    included Availability

    enum post_status: { available: 1,  unavailable: 2 }
    enum discount_type: { flat: 1,  percentage: 2 }

    has_and_belongs_to_many :food_items
    has_many :discount_timings
end
