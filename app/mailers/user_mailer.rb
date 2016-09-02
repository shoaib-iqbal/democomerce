class UserMailer < ActionMailer::Base
  default from: "shoaib@gems.techverx"
  def order_confirmation(order,email)
  	@order = order
  	
  	@url = "http://localhost:3000"
  	@logo_url = "http://localhost:3000/system/admin/images/avatars/000/000/037/large/16.jpg?1471448977"
  	mail(to: "saim@gems.techverx.com", subject: 'Order Detail')
  	
  end
  def order_confirmation_vendor(order,email)
  	@order = order
  	
  	@url = "http://localhost:3000"
  	@logo_url = "http://localhost:3000/system/admin/images/avatars/000/000/037/large/16.jpg?1471448977"
  	mail(to: "saim@gems.techverx.com", subject: 'Order Detail')
  end
end