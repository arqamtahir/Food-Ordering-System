class GroupItem < ApplicationRecord
    has_and_belongs_to_many :options
end
