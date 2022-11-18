class DealItem < ApplicationRecord
    enum post_status: { available: 1,  unavailable: 2 }
    
    belongs_to :deals, optional: true
    belongs_to :deal_itemable, polymorphic: true
    has_many :order_items,as: :order_itemable

end

