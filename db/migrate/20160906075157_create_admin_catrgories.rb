class CreateAdminCatrgories < ActiveRecord::Migration
  def change
    create_table :admin_catrgories do |t|
		t.string :name
	  
        t.timestamps null: false
    end
  end
end
