class Admin::Category < ActiveRecord::Base
	has_and_belongs_to_many :products, class_name: 'Admin::Product'
	has_one :image ,as: :imageable, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :image ,reject_if: proc{ |attributes| attributes['avatar'].blank?}
	translates :name
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
end
