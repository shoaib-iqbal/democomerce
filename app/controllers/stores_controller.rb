class StoresController < ApplicationController
	def index
		if params[:free_delivery].present?
			@vendors = User.all
			@vendors = @vendors.where(:free_delivery => true)
		else
			@vendors = User.all
			
  	end
  	respond_to do |format|
			format.js {}
			format.html
			format.json{}
		end
	end

	def show
	end
end
