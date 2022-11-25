class Addon < ApplicationRecord
    include Discard::Model

    included Availability
    enum post_status: { available: 1,  unavailable: 2 }

    has_many :addon_items, dependent: :destroy
    belongs_to :resturant

    validates :name, presence: true , length: {minimum:4, maximum:50}
    validates :description, presence: true , length: {minimum:6, maximum:100}
    validates :price, presence: true 
    validates :post_status, presence: true 

    def self.ransackable_scopes(auth_object = nil)
	    %i(available unavailable)
    end
end
