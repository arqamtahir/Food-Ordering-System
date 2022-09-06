ActiveAdmin.register Resturant do
  permit_params :name, :location, :contact, :open_close_status

  index do
    selectable_column
    column :id
    column :name
    column :location
    column :open_close_status
    column :contact
    actions
  end
end
