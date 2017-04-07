class Admin::VendorCategoriesController < AdminController
  before_action :set_admin_vendor_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/vendor_categories
  # GET /admin/vendor_categories.json
  def index
    @admin_vendor_categories = Admin::VendorCategory.all
  end

  # GET /admin/vendor_categories/1
  # GET /admin/vendor_categories/1.json
  def show
  end

  # GET /admin/vendor_categories/new
  def new
    @admin_vendor_category = Admin::VendorCategory.new
  end

  # GET /admin/vendor_categories/1/edit
  def edit
  end

  # POST /admin/vendor_categories
  # POST /admin/vendor_categories.json
  def create
    @admin_vendor_category = Admin::VendorCategory.new(admin_vendor_category_params)

    respond_to do |format|
      if @admin_vendor_category.save
        format.html { redirect_to admin_vendor_categories_path, notice: 'Vendor category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_vendor_category }
      else
        format.html { render :new }
        format.json { render json: @admin_vendor_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vendor_categories/1
  # PATCH/PUT /admin/vendor_categories/1.json
  def update
    respond_to do |format|
      if @admin_vendor_category.update(admin_vendor_category_params)
        format.html { redirect_to admin_vendor_categories_path, notice: 'Vendor category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_vendor_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_vendor_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vendor_categories/1
  # DELETE /admin/vendor_categories/1.json
  def destroy
    @admin_vendor_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_vendor_categories_url, notice: 'Vendor category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vendor_category
      @admin_vendor_category = Admin::VendorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_vendor_category_params
      params.require(:admin_vendor_category).permit(:name)
    end
end
