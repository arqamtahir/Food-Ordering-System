class Menu < ApplicationRecord
    include Discard::Model
    included Availability

    enum post_status: {available: 1, unavailable: 2}

    validates :name, presence: true , length: {minimum:4, maximum:50}

    belongs_to :resturant, optional: true
    has_and_belongs_to_many :timings
    has_many :menu_items, dependent: :destroy
    has_many :timings, dependent: :destroy


    accepts_nested_attributes_for :menu_items, allow_destroy: true
    accepts_nested_attributes_for :timings, reject_if: :all_blank, allow_destroy: true

    def self.ransackable_scopes(auth_object = nil)
	    %i(available unavailable)
    end
end
