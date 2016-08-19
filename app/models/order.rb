class Order < ActiveRecord::Base
    has_many :line_items
    ORDER_NUMBER_LENGTH  = 9
    ORDER_NUMBER_LETTERS = false
    ORDER_NUMBER_PREFIX  = 'R'

    before_validation :generate_order_number, on: :create

 def generate_order_number(options = {})
	  options[:length]  ||= ORDER_NUMBER_LENGTH
	  options[:letters] ||= ORDER_NUMBER_LETTERS
	  options[:prefix]  ||= ORDER_NUMBER_PREFIX

	  possible = (0..9).to_a
	  possible += ('A'..'Z').to_a if options[:letters]

	  self.number ||= loop do
	    # Make a random number.
	    random = "#{options[:prefix]}#{(0...options[:length]).map { possible.shuffle.first }.join}"
	    # Use the random  number if no other order exists with it.
	    if self.class.exists?(number: random)
	      # If over half of all possible options are taken add another digit.
	      options[:length] += 1 if self.class.count > (10 ** options[:length] / 2)
	    else
	      break random
	    end
	  end
	end

	def sub_total
		total=0
		
		self.line_items.each do |item| 
			if item.product.discounted_pric.present?
				total+= item.quantity*item.product.discounted_pric
			else 
				total+= item.quantity*item.product.price
			end
		end
		return total
	end
end
