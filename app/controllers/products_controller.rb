class ProductsController < ApplicationController
	def show
		@product=Admin::Product.find(params[:id])
		@vendor_product = Admin::Product.where(:user_id => @product.user_id)
		
		@top_sellers=Admin::Product.order(created_at: :desc).limit(3)
		@featured_products=Admin::Product.where(:featured => "true")

		if request.xhr?
	      if params[:id].present?
	      	
	        @product=Admin::Product.find(params[:id])
	        render :partial => "details_popup"
	      end
	     
	    end
		respond_to do |format|
	        format.js {}
	        format.html
      	end
 
	end



	def index
		if params[:vendor]
			@vendor_product = Admin::Product.where(:user_id => params[:vendor])
		else
			@vendor_product = Admin::Product.all
		end	
	end
end
