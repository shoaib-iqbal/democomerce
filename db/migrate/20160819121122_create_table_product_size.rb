class CreateTableProductSize < ActiveRecord::Migration
  def change
    create_table :admin_colors_products do |t|
      t.integer :product_id
      t.integer :color_id

      t.timestamps null: false
    end
  end
end
