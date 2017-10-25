class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :location
      t.integer :user_id
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
