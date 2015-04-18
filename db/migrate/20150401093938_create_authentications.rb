class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token
      t.datetime :expired_at
      t.string :social_image

      t.timestamps null: false
    end
  end
end
