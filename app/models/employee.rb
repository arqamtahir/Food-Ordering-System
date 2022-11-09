class Employee < ApplicationRecord

  has_one_attached :avatar

  enum designation: { employee: 0, manager: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable
  belongs_to :resturant ,optional:true
  has_many :order
  has_many :subordinates, class_name: 'Employee',foreign_key: "manager_id"
  belongs_to :manager, class_name: 'Employee', optional: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
