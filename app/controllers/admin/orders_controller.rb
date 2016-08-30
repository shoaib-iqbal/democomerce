class Admin::OrdersController < AdminController

	def index
		@orders = Order.where(state: 'complete').order(created_at: :desc)
	end

	def show
		@order_detail=Order.find(params[:id])

		# byebug
		
	end
end
