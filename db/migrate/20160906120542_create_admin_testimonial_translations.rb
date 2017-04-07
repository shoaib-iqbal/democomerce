class CreateAdminTestimonialTranslations < ActiveRecord::Migration
  def change
    create_table :admin_testimonial_translations do |t|
   		t.integer :admin_testimonial_id
   		t.string  :locale
   		t.string  :name
   		t.string  :description
   		t.string  :value 
    end
  end
end
