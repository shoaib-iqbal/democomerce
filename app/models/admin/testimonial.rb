class Admin::Testimonial < ActiveRecord::Base
	has_one :image,as: :imageable
	accepts_nested_attributes_for :image ,reject_if: proc{ |attributes| attributes['avatar'].nil?}
	translates :name, :description
end

