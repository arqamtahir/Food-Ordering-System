class OrderItem < ApplicationRecord
    belongs_to :option
    belongs_to :food_item
    belongs_to :order_itemable , polymorphic: true

end
