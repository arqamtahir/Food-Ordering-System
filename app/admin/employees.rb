ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :phone, :email, :password, :password_confirmation, :resturant_id, :manager_id, :designation

  action_item :view_site do
    link_to 'Invite New employee', new_invitation_admin_employees_path
end

collection_action :new_invitation do
  @employee = Employee.new
end 

collection_action :send_invitation, :method => :post do
  @employee = Employee.invite!(permitted_params[:employee], current_employee)

  if @employee.errors.empty?
      flash[:success] = "employee has been successfully invited." 
      redirect_to admin_employees_path
  else
      messages = @employee.errors.full_messages.map { |msg| msg }.join
      flash[:error] = "Error: " + messages
      redirect_to new_invitation_admin_employees_path
  end
end

  # action_item :view_site do
  #   link_to "Invite Employee", new_employee_invitation_path
  # end
  
  index do 
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :phone
    column :designation
    column :resturant
    column :manager
    column :email
    column :created_at
    column :updated_at
    actions
  end

    filter :id
    filter :first_name
    filter :last_name
    filter :phone
    filter :designation
    filter :resturant
    filter :manager
    filter :email
    filter :created_at
    filter :updated_at
    
    show do
      attributes_table do
        row :first_name
        row :last_name
        row :email
        row :resturant
        row :designation
        row :manager
        row :created_at
        row :updated_at
        row :invitation_token
        row :invitation_created_at
        row :invitation_sent_at
        row :invitation_accepted_at
        row :invited_by
      end
      active_admin_comments
    end
    
    form do |f|
      inputs "Details" do
        input :first_name
        input :last_name
        input :email
        input :phone
        input :designation
        input :resturant_id, :as => :select, :collection => Resturant.all.collect {|resturant| [resturant.name, resturant.id] }
        # input :resturant
        input :manager_id, :as => :select, :collection => Employee.where(designation: 1 ).collect{|manager| [manager.full_name, manager.id] }
        input :password
        actions
      end
    end    
  end
