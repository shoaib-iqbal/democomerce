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
    respond_to do |format|
          format.js {}
          format.html
        end
 
  end

  def index
    byebug
    if params[:vendor].present?
      products = Admin::Product.where(:user_id => params[:vendor])
      @products = Admin::Product.filter_search(params, products)

      @sizes = Admin::Size.all.where(:user_id => params[:vendor])
      @colors = Admin::Color.all.where(:user_id => params[:vendor])
    else
      products = Admin::Product.all
      @products = Admin::Product.filter_search(params, products)
      
      @sizes = Admin::Size.all
      @colors = Admin::Color.all
    end 
  end
  
end
