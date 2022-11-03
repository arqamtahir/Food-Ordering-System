class Employees::ProfilesController < ApplicationController
  def show
    @employee = current_employee
  end
end
