class HomeController < ApplicationController
	def index
		@admin_products = Admin::Product.all
	end
end
