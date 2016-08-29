class Address < ActiveRecord::Base
	validates:address, presence: true, length: { maximum: 50 }
  	validates:city, presence: true, length: { maximum: 50 }
	belongs_to :customer
	belongs_to :order
end
