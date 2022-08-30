class Resturant < ApplicationRecord
has_many :employees
has_many :resturant_schedules
has_many :menus
has_and_belongs_to_many :promo_tokens

end
