class Deal < ApplicationRecord
    has_and_belongs_to_many :deal_items
end
