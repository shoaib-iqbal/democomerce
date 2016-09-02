class UserMailer < ActionMailer::Base
  default from: "shoaib@gems.techverx"
  def order_confirmation(order,email)
  	@order = order
  	
  	@url = "http://localhost:3000"
  	@logo_url = "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=150&h=150"
  	mail(to: email, subject: 'Order Detail')
  	
  end
  def order_confirmation_vendor(order,email)
  	@order = order
  	
  	@url = "http://localhost:3000"
  	@logo_url = "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=150&h=150"
  	mail(to: email, subject: 'New Order Placed, Order Detail')
  end
end