class Admin::SizesController < AdminController
  before_action :set_admin_size, only: [:show, :edit, :update, :destroy]

  # GET /admin/sizes
  # GET /admin/sizes.json
  def index
    if current_user.has_role? :vendoradmin
        @admin_sizes = Admin::Size.all.where(:user_id => current_user.id)
    else
        @admin_sizes = Admin::Size.all
    end
    
    if request.xhr?
      if params[:user_id].present?
        @admin_sizes = Admin::Size.where(:user_id => params[:user_id])
        
      else
        @admin_sizes = Admin::Size.all
      end
    end

    respond_to do |format|
        format.js {}
        format.html
    end
            
  end

  # GET /admin/sizes/1
  # GET /admin/sizes/1.json
  def show
  end

  # GET /admin/sizes/new
  def new
    @admin_size = Admin::Size.new
  end

  # GET /admin/sizes/1/edit
  def edit
  end

  # POST /admin/sizes
  # POST /admin/sizes.json
  def create
    @admin_size = Admin::Size.new(admin_size_params)

    respond_to do |format|
      if @admin_size.save
        format.html { redirect_to admin_sizes_url, notice: 'Size was successfully created.' }
        format.json { render :show, status: :created, location: @admin_size }
      else
        format.html { render :new }
        format.json { render json: @admin_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sizes/1
  # PATCH/PUT /admin/sizes/1.json
  def update
    respond_to do |format|
      if @admin_size.update(admin_size_params)
        format.html { redirect_to admin_sizes_url, notice: 'Size was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_size }
      else
        format.html { render :edit }
        format.json { render json: @admin_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sizes/1
  # DELETE /admin/sizes/1.json
  def destroy
    @admin_size.destroy
    respond_to do |format|
      format.html { redirect_to admin_sizes_url, notice: 'Size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_size
      @admin_size = Admin::Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_size_params
      # if current_user.has_role? :vendoradmin
      #   params[:admin_size][:user_id] = current_user.id
      # end
      # if params[:admin_size][:user_id]==nil
        params[:admin_size][:user_id]=current_user.id
      # end
      params.require(:admin_size).permit(:name, :value,:user_id)
    end
end
