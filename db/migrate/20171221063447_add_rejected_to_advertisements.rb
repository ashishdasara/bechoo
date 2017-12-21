class AddRejectedToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :rejected, :boolean, default: false
  end
end
