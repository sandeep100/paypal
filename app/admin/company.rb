ActiveAdmin.register Company do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :company_name, :first_name, :last_name, :school_name, :address1, :address2, :business_area, :person_title, :industry_type, :dept_size, :country, :city, :zip_code, :about, :image1, :image2, :image3, :profile_image, :email, :password, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
