class Menu < ApplicationRecord
    validates :name, presence: true , length: {minimum:4, maximum:50}
    
    belongs_to :resturant, optional: true
    has_and_belongs_to_many :timings
    has_many :menu_items, dependent: :destroy

    accepts_nested_attributes_for :menu_items, allow_destroy: true

end
