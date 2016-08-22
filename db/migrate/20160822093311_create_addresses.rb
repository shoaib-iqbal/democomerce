class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string  :address1
    	t.string  :address2
    	t.string   :address3
 		t.string   :address_type 

      t.timestamps null: false
    end
  end
end
