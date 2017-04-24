class StoresController < ApplicationController
	def index
		@vendors = User.all
		if params[:city].present? or params[:location].present?

			address = "#{params[:city]}"+','+"#{params[:area]}"
			session[:address] = address
			#location = Geocoder.search(address)
			@vendors = @vendors.near(session[:address], 15, :units => :km)
		end
		if params[:free_delivery].present?
			@vendors = @vendors.where(:free_delivery => true)
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
