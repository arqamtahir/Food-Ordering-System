class SelectedAddon < ApplicationRecord
    belongs_to :addon
    belongs_to :order_item
end
