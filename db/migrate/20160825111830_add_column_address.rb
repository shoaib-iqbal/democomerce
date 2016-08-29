class AddColumnAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :country ,:string
  	add_column :addresses, :country_state ,:string
  	add_column :addresses, :city ,:string
  	add_column :orders,:customer_id,:integer
  end
end
