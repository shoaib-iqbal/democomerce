class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
    	t.string :currency, default: 'USD', null: false

      t.timestamps null: false
    end
  end
  #Store.create
end
