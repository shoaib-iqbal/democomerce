class AddColomn < ActiveRecord::Migration
  def change
  	add_column :admin_colors, :user_id ,:integer
  	add_column :admin_sizes, :user_id ,:integer

  end
end
