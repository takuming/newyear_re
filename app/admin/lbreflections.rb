ActiveAdmin.register Lbreflection do
  permit_params :missing, :taking, :worry, :guilt, :anger, :sorrow, :jealousy
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :missing, :taking, :worry, :guilt, :anger, :sorrow, :jealousy
  #
  # or
  #
  # permit_params do
  #   permitted = [:missing, :taking, :worry, :guilt, :anger, :sorrow, :jealousy]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
