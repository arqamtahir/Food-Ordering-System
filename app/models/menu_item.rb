class MenuItem < ApplicationRecord
    enum post_status: { available: 1,  unavailable: 2 }

    has_and_belongs_to_many :menus
    belongs_to :menu_itemable , polymorphic: true
end

