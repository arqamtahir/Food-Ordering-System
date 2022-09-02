class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :resturant
  has_many :order
  has_many :subordinates, class_name: 'Employee',foreign_key: "manager_id"
  belongs_to :manager, class_name: 'Employee', optional: true
end
