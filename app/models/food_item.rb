class FoodItem < ApplicationRecord
    included Availability
    enum post_status: { available: 1,  unavailable: 2 }

    has_many :option_items
    has_many :options, through: :option_items
    has_and_belongs_to_many :discounts
    has_many :deal_items,as: :deal_itemable
    has_many :order_items,as: :order_itemable
    belongs_to :group_item
    
    def self.ransackable_scopes(auth_object = nil)
	    %i(available unavailable)
    end
end
