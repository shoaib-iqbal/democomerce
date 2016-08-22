class AdminController < ApplicationController
	layout 'admin'
	before_filter :authenticate_user!
  before_filter :is_admin?
  before_filter :is_super_admin?

  


  def is_admin?
		if current_user.has_role? 'vendoradmin' or current_user.has_role? 'superadmin'
  			@users = User.all
  			true
		
		else
  		render :text => 'Who are you to doing this? :)'
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
