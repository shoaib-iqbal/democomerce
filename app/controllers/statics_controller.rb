class StaticsController < ApplicationController
	
	def about_us
		# for brands
		user_ids = Admin::Product.where.not(user_id: nil).collect(&:user_id).uniq
		@brands=User.where(id: user_ids)
		# brands end

	end
	def contact_us
		# for brands
		user_ids = Admin::Product.where.not(user_id: nil).collect(&:user_id).uniq
		@brands=User.where(id: user_ids)
		# brands end

	end
	def news_subscriber
		@exist=NewsletterSubscriber.find_by_email(params[:email_user])
		if @exist.blank?
		
			@user=NewsletterSubscriber.new(email: params[:email_user])
			if(@user.save)
				@message = 'Thank you for subscribing!'
			else
				@message = "Some Thing Went Wrong"
			end

		else
			@message = 'Already Subscribed Thank you!'
		end
		

		respond_to do |format|
	      format.js {}
	      format.html
	      format.json{}
	    end

	end
end
