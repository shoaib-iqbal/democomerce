class LineItemsController < ApplicationController
	def adjust_quantity
		line_item=LineItem.find(params[:line_item_id])

		
		if line_item.update_attributes(quantity: params[:quantity])
			render :partial => '/carts/cart_table'
		 end
		
	end

end
