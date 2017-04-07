class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :admin_sizes, :product_id, :value
  end
end
