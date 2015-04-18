class AddPassImageToAttorneys < ActiveRecord::Migration
  def change
    add_column :attorneys, :profile_image, :string
    add_column :attorneys, :image_1, :string
    add_column :attorneys, :image_2, :string
    add_column :attorneys, :image_3, :string
    add_column :attorneys, :password, :string
  end
end
