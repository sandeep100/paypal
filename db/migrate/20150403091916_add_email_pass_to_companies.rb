class AddEmailPassToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email, :string
    add_column :companies, :password, :string
  end
end
