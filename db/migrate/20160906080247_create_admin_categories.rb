class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|
    	t.string :name
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
