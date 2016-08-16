class CreateAdminImages < ActiveRecord::Migration
  def change
    create_table :admin_images do |t|
    	t.attachment :avatar
    	t.integer :product_id
      t.timestamps null: false
    end
  end
end
