class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_filter :load_cart
 before_filter :set_user_language



private
  def load_cart
	@current_order = Order.find_by_number(session['order_number'])
  	
  end

  	def set_user_language
    	I18n.locale = session['I18n.locale'] rescue 'en'
  	end


end
