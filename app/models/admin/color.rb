module Admin
	class Admin::Color < ActiveRecord::Base
		has_and_belongs_to_many :product
		belongs_to :user
		accepts_nested_attributes_for :user
		translates :name, :value
	end
end
