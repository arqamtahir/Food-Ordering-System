class FoodItem < ApplicationRecord
    include Discard::Model
    
    has_many_attached :food_pictures

    included Availability
    enum post_status: { available: 1,  unavailable: 2 }

    has_many :option_items, inverse_of: :food_item, dependent: :destroy
    has_many :options, through: :option_items
    has_and_belongs_to_many :discounts
    has_many :deal_items,as: :deal_itemable
    has_many :order_items,as: :order_itemable
    belongs_to :group_item
    accepts_nested_attributes_for :option_items, reject_if: :all_blank, allow_destroy: true

    def self.ransackable_scopes(auth_object = nil)
	    %i(available unavailable)
    end
end
