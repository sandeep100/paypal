json.array!(@companies) do |company|
  json.extract! company, :id, :company_name, :first_name, :last_name, :school_name, :address1, :address2, :business_area, :person_title, :industry_type, :dept_size, :country, :city, :zip_code, :about
  json.url company_url(company, format: :json)
end
