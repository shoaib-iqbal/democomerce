class RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # en

  # POST /resource
  def create
    user = User.create(configure_sign_up_params)
    if user
      flash[:notice] = "Please check you email"
    else
      flash[:notice] = "Please try agian"
    end
    redirect_to root_url
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    params.require(:user).permit( :email, :password, broker_profile_attributes: [:company_name, :contact_name, :area_of_service, :contact_address, :contact_phone, :iata_code, :year_in_service, :zip, :country,:broker_info] )
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :confirm_password, :broker_profile_attributes => [:contact_name]) }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
