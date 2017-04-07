class CreateAdminDealOfDays < ActiveRecord::Migration
  def change
    create_table :admin_deal_of_days do |t|
      t.integer :product_id
      t.datetime :expiry_time

      t.timestamps null: false
    end
  end
end
