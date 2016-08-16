class Admin::VendorsController <  AdminController
  before_action :set_admin_vendor, only: [:show, :edit, :update, :destroy]

  # GET /admin/vendors
  # GET /admin/vendors.json
  def index
    @admin_vendors = Admin::Vendor.all
  end

  # GET /admin/vendors/1
  # GET /admin/vendors/1.json
  def show
  end

  # GET /admin/vendors/new
  def new
    @admin_vendor = Admin::Vendor.new
  end

  # GET /admin/vendors/1/edit
  def edit
  end

  # POST /admin/vendors
  # POST /admin/vendors.json
  def create
    @admin_vendor = Admin::Vendor.new(admin_vendor_params)

    respond_to do |format|
      if @admin_vendor.save
        format.html { redirect_to @admin_vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @admin_vendor }
      else
        format.html { render :new }
        format.json { render json: @admin_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vendors/1
  # PATCH/PUT /admin/vendors/1.json
  def update
    respond_to do |format|
      if @admin_vendor.update(admin_vendor_params)
        format.html { redirect_to @admin_vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_vendor }
      else
        format.html { render :edit }
        format.json { render json: @admin_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vendors/1
  # DELETE /admin/vendors/1.json
  def destroy
    @admin_vendor.destroy
    respond_to do |format|
      format.html { redirect_to admin_vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vendor
      @admin_vendor = Admin::Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_vendor_params
      params.fetch(:admin_vendor, {})
    end
end
