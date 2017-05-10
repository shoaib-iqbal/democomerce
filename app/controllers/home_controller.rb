class HomeController < ApplicationController
	def index
		# @admin_products = Admin::Product.all
		
		
		@featured_products=Admin::Product.where(:featured => "true").order(created_at: :desc)
		@best_selling=Admin::Product.where(:homepage => "true").order(created_at: :desc)
		@vendors = User.all
		if @vendors.present?
		  # Vendors within 10 Km
		  @vendors = @vendors.where(:popular => true)
		  if params[:latitude].present? and params[:longitude].present?
		  	if params[:latitude].first(6) != session[:latitude].first(6) and  params[:longitude].first(6) != session[:longitude].first(6)
		  		address = User.set_location(params[:latitude],params[:longitude])
		  	end
					# query.address
				session[:address] = address
		    session[:latitude] = params[:latitude]
		    session[:longitude] = session[:longitude]
		    @vendors = @vendors.near([params[:latitude], params[:longitude]], 15, :units => :km)
		    
		    	respond_to do |format|
		          format.js {}
		          format.html
		          format.json{}
		        end

		  end
		end

		



		# @featured_products=Admin::Product.where(:featured => "true").order(created_at: :desc)
		# @unfeatured_products=Admin::Product.where(:homepage => "true").order(created_at: :desc)
		# @admin_deal_of_days = Admin::DealOfDay.where('expiry_time >= ?', DateTime.now).order('expiry_time')

		# @testimonials = Admin::Testimonial.all
		# @categories_all=Admin::Category.all
		# # for brands
		# user_ids = Admin::Product.where.not(user_id: nil).collect(&:user_id).uniq
		# @brands=User.where(id: user_ids)
		# # brands end


		# if Admin::Category.second and Admin::Category.second.products.present? 
		# 	@category_two= Admin::Category.second.products.order("RANDOM()") 
		# 	@category_two_name=Admin::Category.second.name
		# else
		# 	@category_two= Admin::Category.fourth.products.order("RANDOM()")  rescue '' 
		# 	@category_two_name=Admin::Category.fourth.name  rescue ''

		# end


		# if Admin::Category.third and Admin::Category.third.products.present? 
		# 	@category_three= Admin::Category.third.products.order("RANDOM()")
		# 	@category_three_name=Admin::Category.third.name
		# else
		# 	@category_three= Admin::Category.fifth.products.order("RANDOM()") rescue ''
		# 	@category_three_name=Admin::Category.fifth.name rescue ''

		# end

		# if Admin::Category.first and Admin::Category.first.products.present? 
		# 	@category_one= Admin::Category.first.products.order("RANDOM()")
		# 	@category_one_name=Admin::Category.first.name
		# else
		# 	@category_one= Admin::Category.sixth.products.order("RANDOM()") rescue ''
		# 	@category_one_name=Admin::Category.sixth.name rescue ''

		# end
		
		
		
		

	end
	def change_languages
		session['language']= params[:lang]
		render :nothing => true
	end
end
