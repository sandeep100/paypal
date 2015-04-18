class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.text :address1
      t.text :address2
      t.string :country
      t.string :city
      t.string :zip_code
      t.string :school_name
      t.integer :greduate_year
      t.string :jurisdiction
      t.string :altematives
      t.string :expert
      t.string :support
      t.string :gender
      t.text :about

      t.timestamps null: false
    end
  end
end
