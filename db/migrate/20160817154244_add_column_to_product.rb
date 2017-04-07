class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :admin_products, :user_id, :string
  end
end
