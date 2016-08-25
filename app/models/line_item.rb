class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product , class_name: 'Admin::Product'

	def get_name
		
		Admin::Product.where(:id => self.product_id).first.name rescue''
	end

	def get_image
		Admin::Product.where(:id => self.product_id).first.images.first.avatar.url(:thumbnail) rescue''
	end

	def get_size
		Admin::Product.where(:id => self.product_id).first.images.first.avatar.url rescue''
	end
	def size_name
		Admin::Size.find(self.size_id).name rescue''
		
	end
	def color_name
		Admin::Color.find(self.color_id).name rescue''
		
	end
	
	def total
		if self.product.discounted_price.present?
			return self.quantity* self.product.discounted_price
		else 
			return self.quantity* self.product.price rescue '0'
		end

		
	end

end
