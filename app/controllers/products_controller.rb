class ProductsController < ApplicationController
	def show
		@product=Admin::Product.find(params[:id])
		@vendor_product = Admin::Product.where(:user_id => @product.user_id)
		
		@top_sellers=Admin::Product.order(created_at: :desc).limit(3)
		@featured_products=Admin::Product.where(:featured => "true")

	end



	def index
		if params[:vendor]
			@vendor_product = Admin::Product.where(:user_id => params[:vendor])
		else
			@vendor_product = Admin::Product.all
		end	
	end
end
