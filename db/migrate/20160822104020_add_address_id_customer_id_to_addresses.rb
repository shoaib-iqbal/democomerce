class AddAddressIdCustomerIdToAddresses < ActiveRecord::Migration
  def change
  	add_column :addresses, :order_id ,:integer
  	add_column :addresses, :customer_id , :integer
  end
end
