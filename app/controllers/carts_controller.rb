class CartsController < ApplicationController
	skip_before_action :create

	def index
		
	end
	def create
		product = Admin::Product.find_by_id(params[:product_id])
		unless @order
			@order = Order.create
		end
		line_itm = LineItem.create(:quantity => params[:quantity],:product_id => product.id ,:order_id => @order.id )

		session['order_number'] = @order.number

		render :nothing => true
	end
	
end
