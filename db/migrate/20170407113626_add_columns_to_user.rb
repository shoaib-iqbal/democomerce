class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :free_delivery, :boolean
  	add_column :users, :delivery_time, :string
  end
end
