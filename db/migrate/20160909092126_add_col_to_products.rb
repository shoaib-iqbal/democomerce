class AddColToProducts < ActiveRecord::Migration
  def change
  	add_column :admin_products, :homepage, :boolean, :default=>:false
  	add_column :admin_categories, :slug,:string
  end
end
