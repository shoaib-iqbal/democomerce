class CreateCategoryProducts < ActiveRecord::Migration
  def change
  	# remove_column :admin_products, :category_id
    create_table :admin_categories_products do |t|
    	
    	t.integer :category_id
    	t.integer :product_id
    end
  end
end
