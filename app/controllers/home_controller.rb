class HomeController < ApplicationController
	def index
		# @admin_products = Admin::Product.all
		@featured_products=Admin::Product.where(:featured => "true").order(created_at: :desc)
		@unfeatured_products=Admin::Product.where(:featured => "false").order(created_at: :desc)
		@admin_deal_of_days = Admin::DealOfDay.where('expiry_time >= ?', DateTime.now).order('expiry_time')
		@testimonials = Admin::Testimonial.all
	end
	def change_languages
		session['language']= params[:lang]
		render :nothing => true
	end
end
