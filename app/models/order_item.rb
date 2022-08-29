class OrderItem < ApplicationRecord
    belongs_to :option
    belongs_to :food_item

end
