ActiveAdmin.register Effort do
  permit_params :change, :keep, :challenge, :influence,:surround, :endofyear
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :change, :keep, :challenge, :influence, :surround, :endofyear
  #
  # or
  #
  # permit_params do
  #   permitted = [:change, :keep, :challenge, :influence, :surround, :endofyear]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
