class Employee < ApplicationRecord
  after_update :send_alert
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

  validates :first_name, :last_name, :phone, :email, :resturant, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*\z/ }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 20 }
  validates :email, uniqueness: true, on: :create,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, numericality:{
                    only_integer: true,
                    message: 'can only contain numbers'},
                    length:{
                    minimum: 11,
                    maximum: 16,
                    message: 'containing invalid length'}

  def full_name
    "#{first_name} #{last_name}"
  end

  protected

  def send_alert
    EmployeeMailer.edit_information_mail(self).deliver
  end
end
