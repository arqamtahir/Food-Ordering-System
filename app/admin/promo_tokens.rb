ActiveAdmin.register PromoToken do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :token_name, :discount_percentage, :post_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:token_name, :discount_percentage, :post_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
