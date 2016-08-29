module Admin

	class Admin::Size < ActiveRecord::Base

		has_and_belongs_to_many :products
		belongs_to :user
		accepts_nested_attributes_for :user
		translates :name, :value

	end
end