class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    

    if current_user.has_role? :superadmin
      @admin_categories = Admin::Category.all
    else
      @admin_categories = Admin::Category.where(:user_id => current_user.id)
    end


    if request.xhr?
      if params[:user_id].present?
        @admin_categories = Admin::Category.where(:user_id => params[:user_id])
        
      else
        @admin_categories = Admin::Category.all
      end
    end
    respond_to do |format|
        format.js {}
        format.html
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::Category.new

    @admin_category.build_image
  end

  # GET /admin/categories/1/edit
  def edit
    unless @admin_category.image.present?
      @admin_category.build_image
    end
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @admin_category = Admin::Category.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        
       
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      # if @admin_category!= admin_category_params['user_id']
      #    @admin_category.products.where(:user_id =>  @admin_category.user_id).update_all(:user_id => admin_category_params['user_id'])
      # end
      if @admin_category.update(admin_category_params)

        format.html { redirect_to admin_categories_url, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
     if current_user.has_role? :vendoradmin
        params[:admin_category][:user_id] = current_user.id
      end
     params.require(:admin_category).permit(:name,:user_id, image_attributes: [:name, :avatar])

  end
end
