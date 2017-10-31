class CreateCartProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_products do |t|
      t.integer :cart_id
      t.integer :advertisement_id
      t.integer :quantity, default: 1
      t.timestamps
    end
    add_index :cart_products, :cart_id
    add_index :cart_products, :advertisement_id
  end
end
