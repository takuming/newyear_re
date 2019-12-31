ActiveAdmin.register Goal do
  permit_params :title, :action,:problem ,:reason,:people,:environment
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :action, 
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :action, ]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
