class VendorsController < ApplicationController
  def index
    @vendors = User.all
    if params[:latitude].present? and params[:longitude].present?
      if @vendors.present?
        # Vendors within 10 Km
        @vendors = @vendors.near([params[:latitude], params[:longitude]], 10)
        products = find_products(@vendors, params[:search])
        vendors_ids = products.collect(&:user_id) if products.present?
        @vendors = User.where(id: vendors_ids)
      end
    end
  end



private

  def find_products(near_vendors, search)
    if near_vendors.present? and search.present?

      ids = near_vendors.collect(&:id)
       # products = Admin::Product.where(user_id: ids).where("LOWER(admin_products.name) LIKE ?" , "%#{search}%".downcase)
      return products = Admin::Product.where(user_id: ids).where(name:  search)
    end
  end

end
