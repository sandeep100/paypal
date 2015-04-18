class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :image1, :string
    add_column :companies, :image2, :string
    add_column :companies, :image3, :string
  end
end
