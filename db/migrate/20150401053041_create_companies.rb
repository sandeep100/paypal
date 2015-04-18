class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :school_name
      t.text :address1
      t.text :address2
      t.string :business_area
      t.string :person_title
      t.string :industry_type
      t.integer :dept_size
      t.string :country
      t.string :city
      t.string :zip_code
      t.text :about

      t.timestamps null: false
    end
  end
end
