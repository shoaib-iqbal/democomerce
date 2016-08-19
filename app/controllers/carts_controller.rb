class CartsController < ApplicationController
	skip_before_action :create

	def index
		
	end
	def create
		product = Admin::Product.find_by_id(params[:product_id])
		unless @current_order
			@current_order = Order.create(:state => :cart)
			# byebug
			session['order_number'] = @current_order.number
		end
		 # byebug
		# if @current_order.line_items.present? and  @current_order.line_items.collect(&:product_id).include? params[:product_id].to_i and @current_order.line_items.collect(&:size_id).include? params[:size_id].to_i and @current_order.line_items.collect(&:color_id).include? params[:color_id].to_i
			line_item = @current_order.line_items.where(:product_id=> params[:product_id],:size_id => params[:size_id],:color_id=> params[:color_id]).first
			if line_item.present?
				line_item.quantity += params[:quantity].to_i
				line_item.save 
				# byebug	
				puts "quantity sdfsdfsdfdsf  sdfdsfsdff"
			# end
		else

			line_itm = LineItem.create(:quantity => params[:quantity],:product_id => product.id ,:order_id => @current_order.id,:size_id => params[:size_id] ,:color_id => params[:color_id])
		end
		render :nothing => true
	end

	def destroy

	end
	
end
