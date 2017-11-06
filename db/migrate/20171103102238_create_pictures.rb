class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :advertisement_id
      t.timestamps
    end

  end
end
