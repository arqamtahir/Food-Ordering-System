class MenuItem < ApplicationRecord
    included Availability
    enum post_status: { available: 1,  unavailable: 2 }

    belongs_to :menu_itemable , polymorphic: true
    belongs_to :menu, optional: true
end

