ActiveAdmin.register Attorney do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :first_name, :middle_name, :last_name, :email, :address1, :address2, :country, :city, :zip_code, :school_name, :greduate_year, :jurisdiction, :altematives, :expert, :support, :gender, :about, :image_1, :image_2, :image_3, :profile_image, :password, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
