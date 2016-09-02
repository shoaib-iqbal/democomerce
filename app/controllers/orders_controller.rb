class OrdersController < ApplicationController
  before_action :check_session_order
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  # def index
  #   @orders = Order.all
  # end


  def check_session_order
    if @current_order.blank?
      redirect_to '/'
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  # def show
  # end

  # # GET /orders/new
  # def new
  #   @order = Order.new
  # end

  def checkout
    
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
 
    if current_customer
      redirect_to checkout_details_path
    else
      @customer  = Customer.new
    end

  end

  def details
    # byebug
    if params[:user].present?
     login_user(params)
      
    else
      # byebug
      #if @current_order.addresses.blank?
        @current_order.addresses.build
      #end 
      if request.patch?
        
        if @current_order.update(order_params)
            render :template => 'orders/confirmation_page'
           
        end
      end
    end
  end
  def confirmation_page
     @current_order.state = 'complete'
     @current_order.customer=current_customer if current_customer
     @current_order.save

     users=User.with_role :superadmin
     users.each do |user|
        UserMailer.order_confirmation(@current_order, user.email).deliver rescue ''
     end
     @current_order.line_items.group_by(&:user_id).each do |user,lineitems|
      emailaddress=User.find(user).email
      UserMailer.order_confirmation_vendor(lineitems, emailaddress).deliver rescue''
     end



     session['order_number']=nil
     redirect_to '/'
  end


  def login_user(params)
  customer = Customer.find_by_email(params[:user][:email])
  if customer.present?
     if customer.valid_password?(params[:user][:password])
      sign_in(:customer, customer)
      redirect_to checkout_details_path, :notice => "Signed in successfully."
      return
     end
  end
    redirect_to checkout_path, :alert => "Email or Password is invalid."
end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    session['order_number']=nil
    session['line_items_count']=0
    # byebug
    if @current_order and @current_order.line_items.present?

      @current_order.destroy
    end
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      
      params.require(:order).permit(:email_address,:email,:country,:country_state,:city,:phone,:first_name,:order_notes,:last_name,:delivery_name, addresses_attributes: [:id,:address_type,:address,:country,:country_state,:city ])
    end
end
