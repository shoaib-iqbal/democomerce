class ProductsController < ApplicationController
  
  def show
    @product=Admin::Product.friendly.find(params[:id])
    @vendor_product = Admin::Product.where(:user_id => @product.user_id)
    
    @top_sellers=Admin::Product.order(created_at: :desc)

    @featured_products=Admin::Product.where(:featured => "true")

    if request.xhr?
        if params[:id].present?
          
          @product=Admin::Product.friendly.find(params[:id])
          render :partial => "details_popup"
        end
       
    end
    @min_price=Admin::Product.minimum("price")
    @max_price=Admin::Product.maximum("price")

    respond_to do |format|
      format.js {}
      format.html
      format.json{}
    end
 
  end

  def index

    @selected_sizes = Admin::Size.where(id: params[:sizes_ids]) if params[:sizes_ids].present?
    @selected_colors = Admin::Color.where(id: params[:colors_ids]) if params[:colors_ids].present?
    if params[:vendor].present?
      products = Admin::Product.where(:user_id => params[:vendor])
      @total_products = Admin::Product.filter_search(params, products)
    
      @products = @total_products

      @sizes = Admin::Size.all.where(:user_id => params[:vendor])
      @colors = Admin::Color.all.where(:user_id => params[:vendor])
    else
      
      products = Admin::Product.all
      @total_products = Admin::Product.filter_search(params, products)
      @products = @total_products
      
      @sizes = Admin::Size.all
      @colors = Admin::Color.all
    end 
   
    if params[:sorting_order].present?

      @products = Admin::Product.other_filter_sort(@products, params[:sorting_order])
      

    end
    @products = Kaminari.paginate_array(@products,total_count: @products.count).page(params[:page]).per(6)

    @min_price=Admin::Product.minimum("price")
    @max_price=Admin::Product.maximum("price")

    respond_to do |format|
          format.js {}
          format.html
          format.json{}
    end
  end
  
end
