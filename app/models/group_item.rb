class GroupItem < ApplicationRecord
    enum post_status: { available: 1,  unavailable: 2 }

    has_and_belongs_to_many :options
    has_many :deal_items,as: :deal_itemable
    has_many :menu_items,as: :menu_itemable
end
