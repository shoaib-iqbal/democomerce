class RenameDiscountedPrice < ActiveRecord::Migration
  def change
  	rename_column :admin_products,:discounted_pric,:discounted_price
  end
end
