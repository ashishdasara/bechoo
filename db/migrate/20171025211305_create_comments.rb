class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :user_id, null: false
      t.integer :advertisement_id, null: false
      t.boolean :approved, default: false
      t.references :approved_by, class_name: "User"
      t.timestamps
    end
    add_index("comments", "user_id")
    add_index("comments", "advertisement_id")
  end
end
