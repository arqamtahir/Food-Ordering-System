class Resturant < ApplicationRecord
has_many :employees
has_many :resturant_schedules
end
