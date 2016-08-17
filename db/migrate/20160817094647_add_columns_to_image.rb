class AddColumnsToImage < ActiveRecord::Migration
  def change
    add_column :admin_images, :imageable_id, :integer
    add_column :admin_images, :imageable_type, :string
  end
end
