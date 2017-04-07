class CreateAdminTestimonials < ActiveRecord::Migration
  def change
    create_table :admin_testimonials do |t|
    	t.string :name
    	t.text   :description
    	

      t.timestamps null: false
    end
  end
end
