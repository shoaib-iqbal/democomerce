class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_filter :is_super_admin?
  let :superadmin, :all
  let :vendoradmin ,[:edit, :update]
  # GET /admin/users
  # GET /admin/users.json
  def is_super_admin?
    if  current_user.has_role? 'superadmin'
        return true
      else
        return false
    end
  end

  def index
   @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    if current_user.has_role? :vendoradmin and current_user.id != @user.id
      redirect_to '/admin'

      respond_to do |format|
      
        format.html {  }
        format.json { }
     
      end
    end

    
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
   @user = User.new(admin_user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_url, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location:@user }
      else
        flash[:notice] = @user.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json:@user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    if current_user.has_role? :vendoradmin
      @user.update(edit_admin_user_params)
      redirect_to '/admin'
    
    else
      respond_to do |format|
        if @user.update(edit_admin_user_params)
          format.html { redirect_to admin_users_url, notice: 'Vendor was successfully updated.' }
          format.json { render :show, status: :ok, location:@user }
        else
          format.html { render :edit }
          format.json { render json:@user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
   @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user

      @user = User.find(params[:id])
    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params[:user][:password_confirmation] = params[:user][:password]
      params.require(:user).permit(:name,:location,:email,:password,:password_confirmation, :role_ids)
    end
    def edit_admin_user_params
      params.require(:user).permit(:name,:location,:email, :role_ids)
    end
end
