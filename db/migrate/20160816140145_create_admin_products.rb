class CreateAdminProducts < ActiveRecord::Migration
  def change
    create_table :admin_products do |t|
    	t.string :name
    	t.integer :vendor_id
    	t.integer :price
    	t.integer :discounted_pric
    	t.string :description
      t.timestamps null: false
    end
  end
end
