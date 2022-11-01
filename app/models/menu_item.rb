class MenuItem < ApplicationRecord
    included Availability
    enum post_status: { available: 1,  unavailable: 2 }

    belongs_to :menu_itemable , polymorphic: true
    has_and_belongs_to_many :addons , join_table: "addons_menu_items"
    belongs_to :menu, optional: true
end

