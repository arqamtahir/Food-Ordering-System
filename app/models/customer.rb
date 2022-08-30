class Customer < ApplicationRecord
  has_and_belongs_to_many :promo_tokens
  has_many :order
  has_many :ratings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

end
