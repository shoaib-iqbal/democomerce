class CreateAdminSizes < ActiveRecord::Migration
  def change
    create_table :admin_sizes do |t|
      t.string :name
      t.string :product_id

      t.timestamps null: false
    end
  end
end
