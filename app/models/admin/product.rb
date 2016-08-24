module Admin
	class Product < ActiveRecord::Base
		self.table_name = 'admin_products'
		has_many :images , dependent: :destroy
		has_many :line_items
		has_many :deal_of_days ,:class_name => 'Admin::DealOfDay'
		belongs_to :user
		has_and_belongs_to_many :sizes, class_name: 'Admin::Size'
		has_and_belongs_to_many :colors, class_name: 'Admin::Color'
		# has_attached_file :avatar, styles: {thumbnail: "60x60#"}
		# validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
		accepts_nested_attributes_for :images ,reject_if: proc{ |attributes| attributes['avatar'].blank?}
		accepts_nested_attributes_for :sizes
		accepts_nested_attributes_for :colors 
		translates :name, :description
	 	

	end
end
 