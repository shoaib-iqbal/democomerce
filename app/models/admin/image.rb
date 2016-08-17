module Admin
class Image < ActiveRecord::Base
	self.table_name = 'admin_images'

	belongs_to :imageable, :polymorphic =>true
	has_attached_file :avatar, styles: {normal: "263x348",thumbnail: "60x60#" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
end