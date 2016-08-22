class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    # @admin_products = Admin::Product.all
    
    if current_user.has_role? :superadmin
      @admin_products = Admin::Product.all
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
     # respond_to do |format|
     #    format.js {}
     #    format.html
        

     #  end

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
    @admin_product.images.build 
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Admin::Product.new(admin_product_params)
    respond_to do |format|
      if @admin_product.save
        
        if  params[:admin_product][:image] and params[:admin_product][:image][:avatar]
           params[:admin_product][:image][:avatar].each { |image|
            @admin_product.images.create(avatar: image)
          }
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
          if params[:admin_product][:image] and params[:admin_product][:image][:avatar]
              params[:admin_product][:image][:avatar].each { |image|
                @admin_product.images.create(avatar: image)
              }
          end
          @admin_product.update(admin_product_params)
         
          # if params[:admin_product][:size_ids]
          #   params[:admin_product][:size_ids].each {|size|
          #     @admin_product.sizes.create(name: size)
          #   }

          # end


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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Admin::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      if current_user.has_role? :vendoradmin
        params[:admin_product][:user_id] = current_user.id
      end
       params.require(:admin_product).permit(:id, :description, :name,:avatar,:featured,:price,:user_id,:discounted_pric, images_attributes: [:avatar => []], size_ids: [],color_ids: [] )
    end
end