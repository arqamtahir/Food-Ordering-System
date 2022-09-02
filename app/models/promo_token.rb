class PromoToken < ApplicationRecord
    enum post_status: { available: 1,  unavailable: 2 }

    has_many :token_valid_dates
    has_and_belongs_to_many :customers
    has_and_belongs_to_many :resturants
    has_many :order

end
