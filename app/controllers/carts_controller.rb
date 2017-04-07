class CartsController < ApplicationController
	

	def index
		
	end
	def create
		product = Admin::Product.find_by_id(params[:product_id])
		unless @current_order
			@current_order = Order.create(:state => :cart)
			# byebug
			session['order_number'] = @current_order.number
		end
		# if @current_order.line_items.present? and  @current_order.line_items.collect(&:product_id).include? params[:product_id].to_i and @current_order.line_items.collect(&:size_id).include? params[:size_id].to_i and @current_order.line_items.collect(&:color_id).include? params[:color_id].to_i
			line_item = @current_order.line_items.where(:product_id=> params[:product_id],:size_id => params[:size_id],:color_id=> params[:color_id]).first
			if line_item.present?
				line_item.quantity += params[:quantity].to_i
				line_item.save 
			# end
		else


			line_itm = LineItem.create(:user_id=>product.user.id , :quantity => params[:quantity],:product_id => product.id ,:order_id => @current_order.id,:size_id => params[:size_id] ,:color_id => params[:color_id])
		end

		
		@current_order = Order.find_by_number(session['order_number'])
		# if request.xhr?
		# 	# byebug
		# 	session['line_items_count'] = @current_order.line_items.count rescue '0'
		# 	render :partial => "subcart"
		# else
		# 	render :nothing => true
		# end
		
		respond_to do |format|
	        format.js {render "create", :locals => {:count => @current_order}}
	        format.html
      	end
	end

	def destroy

		LineItem.destroy(params[:id])
		respond_to do |format|
	        format.js {}
	        format.html
      	end
		
	end
	
end
