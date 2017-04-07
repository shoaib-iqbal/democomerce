class RemoveVendorId < ActiveRecord::Migration
  def change
  	remove_column :admin_products,:vendor_id
  end
end
