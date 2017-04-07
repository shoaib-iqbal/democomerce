class AddColToAddresses < ActiveRecord::Migration
  def change
  	add_column :addresses, :phone_number ,:string
  	add_column :addresses, :mobile_number ,:string
  end
end
