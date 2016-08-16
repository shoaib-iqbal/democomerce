class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string  :name
    	t.string :location
    	t.string :string


      t.timestamps null: false
    end
  end
end
