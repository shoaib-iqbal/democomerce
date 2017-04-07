class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_filter :load_cart
 before_filter :set_user_language



    def set_user_language
      @lang = session['language'].present? ? session['language'] : :en 
      I18n.locale = @lang
      # byebug
    end

private
  def load_cart
	@current_order = Order.find_by_number(session['order_number'])
  	
  end


end
