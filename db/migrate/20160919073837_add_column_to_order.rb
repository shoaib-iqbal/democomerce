class AddColumnToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :guest_token ,:string
  end
end
