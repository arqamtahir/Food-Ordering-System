class Resturant < ApplicationRecord
has_many :employees
has_many :resturant_schedules
has_many :menus
end
