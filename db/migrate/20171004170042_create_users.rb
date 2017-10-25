class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 15, null: false
      t.string :last_name, limit: 15
      t.string :username, limit: 20, :uniqueness => true
      t.string :email, uniqueness: true, null: false
      t.string :password_digest, null: false
      t.string :contact_no
      t.timestamps
    end
  end
end
