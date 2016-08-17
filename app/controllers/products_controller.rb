class ProductsController < ApplicationController
	def show
		@product=Admin::Product.find(params[:id])
		@top_sellers=Admin::Product.order(created_at: :desc).limit(3)

	end
end
