class HomeController < ApplicationController
	def index
		# @admin_products = Admin::Product.all
		
		@featured_products=Admin::Product.where(:featured => "true").order(created_at: :desc)
		@unfeatured_products=Admin::Product.where(:featured => "false").order(created_at: :desc)
		@admin_deal_of_days = Admin::DealOfDay.where('expiry_time >= ?', DateTime.now).order('expiry_time')

		@testimonials = Admin::Testimonial.all

		if Admin::Category.second and Admin::Category.second.products.present? 
			@category_two= Admin::Category.second.products.order("RANDOM()") 
			@category_two_name=Admin::Category.second.name
		else
			@category_two= Admin::Category.fourth.products.order("RANDOM()")  rescue '' 
			@category_two_name=Admin::Category.fourth.name  rescue ''

		end


		if Admin::Category.third and Admin::Category.third.products.present? 
			@category_three= Admin::Category.third.products.order("RANDOM()")
			@category_three_name=Admin::Category.third.name
		else
			@category_three= Admin::Category.fifth.products.order("RANDOM()") rescue ''
			@category_three_name=Admin::Category.fifth.name rescue ''

		end

		if Admin::Category.first and Admin::Category.first.products.present? 
			@category_one= Admin::Category.first.products.order("RANDOM()")
			@category_one_name=Admin::Category.first.name
		else
			@category_one= Admin::Category.sixth.products.order("RANDOM()") rescue ''
			@category_one_name=Admin::Category.sixth.name rescue ''

		end
		
		
		
		

	end
	def change_languages
		session['language']= params[:lang]
		render :nothing => true
	end
end
