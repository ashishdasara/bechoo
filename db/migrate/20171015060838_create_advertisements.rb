class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :location, null: false
      t.integer :user_id
      t.string :user_username, null: false
      t.integer :category_id
      t.integer :sub_category_id
      t.boolean :approved, default: false
      t.timestamps
    end
    add_index("advertisements", "user_id")
    add_index("advertisements", "category_id")
    add_index("advertisements", "sub_category_id")

  end
end
