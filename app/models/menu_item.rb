class MenuItem < ApplicationRecord
    has_and_belongs_to_many :menus
    belongs_to :menu_itemable , polymorphic: true
end

