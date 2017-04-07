class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :vendor_category_id,:integer
  end
end
