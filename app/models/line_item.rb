class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	def get_name
		
		Admin::Product.where(:id => self.product_id).first.name
		
		
	end
end
