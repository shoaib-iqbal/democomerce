class Admin::Image < ActiveRecord::Base
	belongs_to :product
	 has_attached_file :avatar, styles: {thumbnail: "60x60#"}
end
