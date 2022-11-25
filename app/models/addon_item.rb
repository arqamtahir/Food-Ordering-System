class AddonItem < ApplicationRecord
  belongs_to :addon_itemable, polymorphic: true
  belongs_to :addon, optional: true
end
