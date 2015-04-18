json.array!(@attorneys) do |attorney|
  json.extract! attorney, :id, :first_name, :middle_name, :last_name, :email, :address1, :address2, :country, :city, :zip_code, :school_name, :greduate_year, :jurisdiction, :altematives, :expert, :support, :gender, :about
  json.url attorney_url(attorney, format: :json)
end
