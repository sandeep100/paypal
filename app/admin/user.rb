ActiveAdmin.register User do
   permit_params :email, :password, :password_confirmation, :of, :attributes, :on, :model

   index do 
    id_column
    column :email
    column :first_name
    actions
   end
  form do |f|
    f.inputs "User forms" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
