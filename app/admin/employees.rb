ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :phone, :designation, :resturant_id, :manager_id, :email, :encrypted_password

  action_item :view_site do
    link_to "Invite Employee", new_employee_invitation_path
  end
  
  index do 
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :phone
    column :designation
    column :resturant_id
    column :manager_id
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
    filter :resturant_id
    filter :manager_id
    filter :email
    filter :created_at
    filter :updated_at
    
    show do
      attributes_table do
        row :first_name
        row :last_name
        row :email
        row :resturant_id
        row :manager_id
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
        input :resturant_id
        input :manager_id
        input :password
        actions
      end
    end
    
  end
