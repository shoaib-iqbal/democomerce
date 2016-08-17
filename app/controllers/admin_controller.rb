class AdminController < ApplicationController
	layout 'admin'
	before_filter :authenticate_user!
  before_filter :is_admin?
  


  def is_admin?
		if current_user.has_role? 'vednoradmin' or current_user.has_role? 'superadmin'
  			true
		else
  		render :text => 'Who are you to doing this? :)'
		end
	end
end
