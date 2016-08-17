module Admin
class Product < ActiveRecord::Base
	self.table_name = 'admin_products'
	 has_attached_file :avatar, styles: {thumbnail: "60x60#"}
	 validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

 #has_many :images

end
end
