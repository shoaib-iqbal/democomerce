class AddColumnSlugToProducts < ActiveRecord::Migration
  def change
  	add_column :admin_products,:slug,:string
  end
end
