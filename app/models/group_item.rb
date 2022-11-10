class GroupItem < ApplicationRecord
    include Discard::Model

    included Availability

    has_many :options , inverse_of: :group_item, dependent: :destroy
    has_many :deal_items,as: :deal_itemable
    has_many :menu_items,as: :menu_itemable
    has_many :food_items
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

    enum post_status: { available: 1,  unavailable: 2 }
end
