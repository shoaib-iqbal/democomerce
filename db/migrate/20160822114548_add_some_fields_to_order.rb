class AddSomeFieldsToOrder < ActiveRecord::Migration
  def change
  	# add_column :orders, :email ,:string
  	add_column :orders, :phone ,:string
  	add_column :orders, :first_name ,:string
  	add_column :orders, :last_name ,:string
  	add_column :orders, :delivery_name ,:string
  	add_column :orders, :order_notes ,:string
  	add_column :orders, :country ,:string
  	add_column :orders, :country_state ,:string
  	add_column :orders ,:city , :string
  	add_column :orders,:payment_type , :string
  end
end
