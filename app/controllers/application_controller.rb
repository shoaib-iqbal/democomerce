class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_filter :load_cart



  def load_cart
  #byebug
@current_order = Order.find_by_number(session['order_number'])
  	
  end
end
