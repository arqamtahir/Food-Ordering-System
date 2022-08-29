class Menu < ApplicationRecord
    belongs_to :resturant
    has_and_belongs_to_many :timings
end
