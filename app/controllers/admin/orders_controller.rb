class Admin::OrdersController < AdminController

	def index
		if current_user.superadmin?
			@orders = Order.where(state: 'complete').order(created_at: :desc)
		else
			line_items_ids = LineItem.where(user_id: current_user.id).collect(&:id)
			@orders = Order.where(state: 'complete').joins(:line_items).where("line_items.id IN (?)",line_items_ids).order(created_at: :desc)
			# byebug
			# @orders = Order.where(state: 'complete').order(created_at: :desc)

		end
		if request.xhr?
	      if params[:user_id].present?
	        line_items_ids = LineItem.where(user_id: params[:user_id]).collect(&:id)
			@orders = Order.where(state: 'complete').joins(:line_items).where("line_items.id IN (?)",line_items_ids).order(created_at: :desc)
			# byebug
	        
	      else
	        @orders = Order.where(state: 'complete').order(created_at: :desc)
	      end
	    end

		respond_to do |format|
	        format.js {}
	        format.html
	    end
	end

	def show
		@order_detail=Order.find(params[:id])
		if current_user.superadmin?

		@line_items = @order_detail.line_items
	else
		@line_items = @order_detail.line_items.where(:user_id => current_user.id)
		
	end
		# byebug
		
	end
end
