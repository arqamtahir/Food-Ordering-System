class OptionItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :option

  delegate :name, :id, to: :option, prefix: true
end
