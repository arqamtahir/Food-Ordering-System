class Order < ApplicationRecord
  enum order_status: { pending: 1,  ready: 2,  deliverd: 3}

  belongs_to :customers
  belongs_to :resturants
  belongs_to :employees
  belongs_to :promo_tokens
  has_one :payment
  has_one :admin_charge
  has_one :resturant_earning
  has_many :ratings
end
