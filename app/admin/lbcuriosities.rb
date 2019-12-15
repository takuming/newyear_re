ActiveAdmin.register Lbcuriosity do
  permit_params :trance, :positive ,:interesting, :comfortable, :theme, :investment
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :trance, :positive, :interesting, :comfortable, :theme, :investment
  #
  # or
  #
  # permit_params do
  #   permitted = [:trance, :positive, :interesting, :comfortable, :theme, :investment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
