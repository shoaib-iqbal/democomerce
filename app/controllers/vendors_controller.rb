class VendorsController < ApplicationController
  def index
    @vendors = User.all
      if @vendors.present?
        # Vendors within 10 Km
        if params[:latitude].present? and params[:longitude].present?
        @vendors = @vendors.near([params[:latitude], params[:longitude]], 10)
      end
        products = find_products(@vendors, params[:search])

        vendors_ids = products.collect(&:user_id) if products.present?
        @vendors = User.where(id: vendors_ids)
      end
    byebug
      
  end



private

  def find_products(near_vendors, search)
    if near_vendors.present? and search.present?

  
      ids = near_vendors.collect(&:id)
      #p_ids = PgSearch.multisearch(search).map(&:searchable_id)
    
      #Admin::Product.set_table_name = 'admin_product_translations'
       products =  Admin::Product.joins(:translations).with_translations(I18n.locale).where("LOWER(admin_product_translations.name) LIKE ?", "%#{search}%".downcase)
       # products = Admin::Product.where(user_id: ids).where("LOWER(admin_products.name) LIKE ?" , "%#{search}%".downcase)
      #products = Admin::Product.where(user_id: ids).where(id:  p_ids)
      return products 

    end
  end

end
