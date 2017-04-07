class DropColumnAddress < ActiveRecord::Migration
  def change
  	remove_column :addresses, :address1
  	remove_column :addresses, :address2
  	remove_column :addresses, :address3
  end
end
