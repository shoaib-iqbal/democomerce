class ProductsController < ApplicationController
	def show
		@product=Admin::Product.find(params[:id])
		@vendor_product = Admin::Product.where(:user_id => @product.id)
		@top_sellers=Admin::Product.order(created_at: :desc).limit(3)
		@featured_products=Admin::Product.where(:featured => "true")

	end



	def index
		
		@vendor_product = Admin::Product.where(:user_id => params[:vendor])
		
	end
end
