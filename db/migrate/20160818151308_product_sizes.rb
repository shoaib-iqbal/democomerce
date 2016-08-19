class ProductSizes < ActiveRecord::Migration
  def change
  	create_table :Product_sizes do |t|
      t.integer :product_id
      t.integer :size_id

      t.timestamps null: false
  end
  end
end
