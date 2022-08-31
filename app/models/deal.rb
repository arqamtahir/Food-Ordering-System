class Deal < ApplicationRecord
    has_and_belongs_to_many :deal_items
    has_many :menu_items,as: :menu_itemable

end
