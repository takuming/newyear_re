ActiveAdmin.register Goal do
  permit_params :title, :action , :problem
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :action, :problem
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :action, :problem]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
