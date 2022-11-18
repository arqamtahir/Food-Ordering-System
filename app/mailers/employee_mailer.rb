class EmployeeMailer < ApplicationMailer
  def edit_information_mail(employee)
    @employee = employee
    mail(to: @employee.email, subject: 'Profile Update Notice')
  end
end
