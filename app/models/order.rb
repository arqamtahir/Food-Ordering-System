class Order < ApplicationRecord
  belongs_to :customers
  belongs_to :resturants
  belongs_to :employees
  belongs_to :promo_tokens
end
