class CreateAdminColors < ActiveRecord::Migration
  def change
    create_table :admin_colors do |t|
    	t.string  :name
    	t.string  :value
      t.timestamps null: false
    end
  end
end
