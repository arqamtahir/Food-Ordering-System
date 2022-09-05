ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :phone, :designation, :resturant_id, :manager_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
end
