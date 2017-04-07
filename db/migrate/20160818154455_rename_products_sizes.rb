class RenameProductsSizes < ActiveRecord::Migration
  def change
  	rename_table :Product_sizes, :admin_products_sizes
  end
end
