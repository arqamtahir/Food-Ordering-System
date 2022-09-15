class Menu < ApplicationRecord
    belongs_to :resturant
    has_and_belongs_to_many :timings
    has_and_belongs_to_many :menu_items
    has_and_belongs_to_many :addons , join_table: "addons_menus"
end
