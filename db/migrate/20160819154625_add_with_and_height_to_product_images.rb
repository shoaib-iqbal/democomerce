class AddWithAndHeightToProductImages < ActiveRecord::Migration
  def change
  	add_column :admin_images,:avatar_width,:integer
  	add_column :admin_images,:avatar_height,:integer
  end
end
