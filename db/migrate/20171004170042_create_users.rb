class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :first_name, limit: 15, null: false
      t.string :last_name, limit: 15
      t.string :username, limit: 20
      t.string :email, null: false
      t.string :contact_no
      t.string :location, null: false, default: "India"
      t.string :password_digest
      t.boolean :approved, default: false
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
