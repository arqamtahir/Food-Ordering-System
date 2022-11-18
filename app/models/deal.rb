class Deal < ApplicationRecord
    include Discard::Model
    included Availability

    enum post_status: { available: 1,  unavailable: 2 }

    has_many :deal_items, dependent: :destroy
    has_many :menu_items,as: :menu_itemable
    has_many :addon_items,as: :addon_itemable

    accepts_nested_attributes_for :deal_items, allow_destroy: true
    accepts_nested_attributes_for :addon_items, allow_destroy: true

    def self.ransackable_scopes(auth_object = nil)
	    %i(available unavailable)
    end
end
