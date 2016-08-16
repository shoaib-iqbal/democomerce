class CreateAdminVendors < ActiveRecord::Migration
  def change
    create_table :admin_vendors do |t|
    	t.string :name
    	t.string :email
    	t.string :location
      t.timestamps null: false
    end
  end
end
