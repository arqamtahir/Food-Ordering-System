class DealItem < ApplicationRecord
    has_and_belongs_to_many :deals
    belongs_to :deal_itemable, polymorphic: true
    has_many :order_items,as: :order_itemable

end
