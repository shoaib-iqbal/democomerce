class Admin::DealOfDay < ActiveRecord::Base
	belongs_to :product ,:class_name => 'Admin::Product'
end
