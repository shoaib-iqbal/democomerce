class Addcoltoproduct < ActiveRecord::Migration
  def change
  	add_column :admin_products, :category_id ,:integer
  end
end
