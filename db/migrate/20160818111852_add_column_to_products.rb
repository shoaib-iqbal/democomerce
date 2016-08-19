class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :featured, :boolean, :default=>:false
  end
end
