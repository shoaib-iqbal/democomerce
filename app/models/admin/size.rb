module Admin

	class Admin::Size < ActiveRecord::Base

		has_and_belongs_to_many :product

	end
end