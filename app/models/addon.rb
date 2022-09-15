class Addon < ApplicationRecord
    validates :name, presence: true , length: {minimum:,4 maximum:50}
    validates :description, presence: true , length: {minimum:,6 maximum:100}
    validates :price, presence: true 
    validates :post_status, presence: true 

    enum post_status: { available: 1,  unavailable: 2 }
    has_and_belongs_to_many :menus , join_table: "addons_menus"
end
