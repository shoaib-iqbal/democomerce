class Customers2Controller < Devise::RegistrationsController

  def new

	# super
	# resource.addresses.build
	build_resource({})
    resource.addresses.build
    respond_with self.resource

  end
  def create

    build_resource(sign_up_params)

    resource.save
    redirect_to root_url
  end




  private

  def sign_up_params

    params.require(:customer).permit(:first_name,:phone_number,:mobile_number, :last_name, :email, :password, :password_confirmation, addresses_attributes: [:country,:country_state,:city,:address ])
  end

  def account_update_params

    params.require(:customer).permit(:first_name, :last_name,:phone_number,:mobile_number, :email, :password, :password_confirmation, :current_password, addresses_attributes: [:country,:country_state,:city,:address ])
  end
end