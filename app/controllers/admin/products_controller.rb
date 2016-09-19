class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    # @admin_products = Admin::Product.all
    
    if current_user.has_role? :superadmin
      @admin_products = Admin::Product.all.sort_by_update
    else
      @admin_products = Admin::Product.where(:user_id => current_user.id)
    end


    if request.xhr?
      if params[:user_id].present?
        @admin_products=Admin::Product.where(:user_id => params[:user_id])
        
      else
        @admin_products = Admin::Product.all
      end
     
    end
     respond_to do |format|
        format.js {}
        format.html
        

      end

  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end
  # def delimg
  #   byebug
  # end
  # GET /admin/products/new
  def new
     @admin_product = Admin::Product.new
     @admin_product.images.build 
  end

  # GET /admin/products/1/edit
  def edit
    # byebug
    unless @admin_product.images.present?
      @admin_product.images.build 
    end
    
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Admin::Product.new(admin_product_params)
    

    respond_to do |format|
      if @admin_product.save
        
        if  params[:skip_crop].blank? and params[:image_data].present? and params[:admin_product][:image].length ==1
          image_st = params[:image_data].split(',')[1]
          decoded_data = Base64.decode64(image_st)
          data = StringIO.new(decoded_data)
          @admin_product.images.create(avatar: data)
        else

          if params[:admin_product][:image] and params[:admin_product][:image][:avatar]
              params[:admin_product][:image][:avatar].each { |image|
                @admin_product.images.create(avatar: image)
              }
          end
          end

        format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
     
      if @admin_product.update(admin_product_params)
        if  params[:skip_crop].blank? and params[:image_data].present?
          image_st = params[:image_data].split(',')[1]
          decoded_data = Base64.decode64(image_st)
          data = StringIO.new(decoded_data)
          @admin_product.images.create(avatar: data)
        else

          if params[:admin_product][:image] and params[:admin_product][:image][:avatar]

              params[:admin_product][:image][:avatar].each { |image|
                @admin_product.images.create(avatar: image)
              }
          end
        end
          #@admin_product.update(admin_product_params)

        format.html { redirect_to admin_products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_size_and_color_of_product
  
    @current_user_colors = Admin::Color.where(:user_id => params[:vendor])
    @current_user_Size = Admin::Size.where(:user_id => params[:vendor])
    @current_user_categories = Admin::Category.where(:user_id => params[:vendor])


    respond_to do |format|
      format.js {}
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product

      @admin_product = Admin::Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      
      if params[:admin_product][:name].present?
        string=params[:admin_product][:name]
        params[:admin_product][:name] = string.slice(0,1).capitalize + string.slice(1..-1)
      end

      if current_user.has_role? :vendoradmin
        params[:admin_product][:user_id] = current_user.id
      end
      
      params.require(:admin_product).permit(:id,:homepage, :description, :name,:featured,:price,:user_id,:discounted_price, images_attributes: [:name, :avatar => []], category_ids: [], size_ids: [],color_ids: [] )
    end
end
