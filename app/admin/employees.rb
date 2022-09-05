ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :phone, :designation, :resturant_id, :manager_id, :email, :encrypted_password

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
 
  end
