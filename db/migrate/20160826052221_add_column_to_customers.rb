class AddColumnToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :first_name, :string
  	add_column :customers, :last_name, :string
  	add_column :customers, :phone_number, :string
  	add_column :customers, :mobile_number, :string
  end
end
