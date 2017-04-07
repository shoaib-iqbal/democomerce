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
    # for brands
    user_ids = Admin::Product.where.not(user_id: nil).collect(&:user_id).uniq
    @brands=User.where(id: user_ids)
    # brands end
    
    respond_to do |format|
      format.js {}
      format.html
      format.json{}
    end
 
  end

  def index

  @vendors = User.all

  #   @selected_sizes = Admin::Size.where(id: params[:sizes_ids]) if params[:sizes_ids].present?
  #   @selected_colors = Admin::Color.where(id: params[:colors_ids]) if params[:colors_ids].present?
  #   if params[:vendor].present?
  #     products = Admin::Product.where(:user_id => params[:vendor])
  #     @total_products = Admin::Product.filter_search(params, products)
    
  #     @products = @total_products

  #     @sizes = Admin::Size.all.where(:user_id => params[:vendor])
  #     @colors = Admin::Color.all.where(:user_id => params[:vendor])
  #   else
      
  #     products = Admin::Product.all
  #     @total_products = Admin::Product.filter_search(params, products)
  #     @products = @total_products
      
  #     @sizes = Admin::Size.all
  #     @colors = Admin::Color.all
  #   end 
   
    
  #   if params[:vendor] and params[:search].present?
  #     #p_ids = PgSearch.multisearch(params[:search]).map(&:searchable_id)
  #      @products = Admin::Product.joins(:translations).with_translations(I18n.locale).where("LOWER(admin_product_translations.name) LIKE ?", "%#{params[:search]}%".downcase).where(:user_id => params[:vendor])
  #     #@products = Admin::Product.where(id: p_ids,user_id: params[:vendor])
  #   end
  #   if params[:category].present?
  #     category = Admin::Category.find(params[:category])
  #     @products = category.products.includes(:sizes)
  #     ids = @products.collect(&:user_id).uniq
  #     # @products.map()
  #     # ids=Admin::Category.find(params[:category]).products.collect(&:id)
  #     # p_ids=@products.joins(:sizes).where("admin_products_sizes.product_id IN (?)", ids).collect(&:id).uniq
      
  #     @sizes = Admin::Size.all.where(:user_id => ids)
  #     @colors = Admin::Color.all.where(:user_id => ids)
  #   end
  #   if params[:sorting_order].present?
  #     @products = Admin::Product.other_filter_sort(@products, params[:sorting_order])
      

  #   end
  #   if params[:search_param] and params[:sorting_order].present?
  #    # byebug
  #     @products = Admin::Product.joins(:translations).with_translations(I18n.locale).where("LOWER(admin_product_translations.name) LIKE ?", "%#{params[:search_param]}%".downcase).where(:user_id => params[:vendor])
  #     @products = Admin::Product.other_filter_sort(@products, params[:sorting_order])
      

  #   end
  #   @total_products=@products.count
  #   # byebug
  #   @min_price = @products.sort_by(&:price).first.price rescue '0'
  #   @max_price = @products.sort_by(&:price).reverse.first.price rescue '0'
  #   if params[:mobile].present?

  #   else

  #       @products = Kaminari.paginate_array(@products,total_count: @products.count).page(params[:page]).per(12)

  #   end
  #   respond_to do |format|
  #         format.js {}
  #         format.html
  #         format.json{}
  #   end
   end
  
end
