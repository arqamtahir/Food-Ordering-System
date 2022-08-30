class GroupItem < ApplicationRecord
    has_and_belongs_to_many :options
    has_many :deal_items,as: :deal_itemable

end
