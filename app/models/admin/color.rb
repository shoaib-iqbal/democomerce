module Admin
class Admin::Color < ActiveRecord::Base
	has_and_belongs_to_many :product
end
end
