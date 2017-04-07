class CreateAdminVendorCategories < ActiveRecord::Migration
  def change
    create_table :admin_vendor_categories do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
