module Admin
class Image < ActiveRecord::Base
	self.table_name = 'admin_images'

	belongs_to :imageable, :polymorphic =>true
	has_attached_file :avatar, styles: {large: "458x606",normal: "263x348",thumbnail: "60x60#",small: "88x144",sidebar: "270x357" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
end