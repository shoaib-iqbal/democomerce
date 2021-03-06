class AdminController < ApplicationController
	layout 'admin'
	before_filter :authenticate_user!
  before_filter :is_admin?
  before_filter :is_super_admin?
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render '/admin/static/page_not_found' # Assuming you have a template named 'record_not_found'
  end

  


  def is_admin?
		if current_user.has_role? 'vendoradmin' or current_user.has_role? 'superadmin'
  			@users = User.all
  			true
		
		else
  		render :text => 'Who are you to doing this? :)'
		sign_out current_user 
		end
	end

	def is_super_admin?
		if current_user.has_role? 'vendoradmin' or current_user.has_role? 'superadmin'
		return true
	else
		return false
	end
	end
end
