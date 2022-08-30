class PromoToken < ApplicationRecord
    has_many :token_valid_dates
    has_and_belongs_to_many :customers
    has_and_belongs_to_many :resturants

end
