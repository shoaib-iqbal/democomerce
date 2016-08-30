class Order < ActiveRecord::Base
    has_many :line_items
    belongs_to :customer
     accepts_nested_attributes_for :customer, reject_if: :all_blank, allow_destroy: true
    #accepts_nested_attributes_for :customer
    has_many :addresses
    accepts_nested_attributes_for :addresses 
    ORDER_NUMBER_LENGTH  = 9
    ORDER_NUMBER_LETTERS = false
    ORDER_NUMBER_PREFIX  = 'R'
    PAYMENT_TYPES = ["Cash On Delivery"]

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
			if item.product and item.product.discounted_price.present?
				total+= item.quantity*item.product.discounted_price rescue '0'
			else 
				total+= item.quantity*item.product.price rescue 0
			end
		end
		return total
	end

	def full_address
		address = self.addresses.last
		if address.present?
			"#{address.address},#{address.city},#{address.country_state},#{address.country}"
		else
		"No address fond"
		end		
	end
end
