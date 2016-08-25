module Admin
class Image < ActiveRecord::Base
	self.table_name = 'admin_images'

	belongs_to :imageable, :polymorphic =>true
	has_attached_file :avatar, styles: {large: "458x606",normal: "263x348",thumbnail: "72x72#",small: "88x144",sidebar: "270x357" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
     after_post_process :find_dimensions
   def find_dimensions
      temporary = avatar.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = avatar.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.avatar_width  = geometry.width
      self.avatar_height = geometry.height
    end
end
end