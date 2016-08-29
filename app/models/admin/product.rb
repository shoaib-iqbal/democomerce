module Admin
  class Product < ActiveRecord::Base
    self.table_name = 'admin_products'
    has_many :images , dependent: :destroy
    has_many :line_items
    has_many :deal_of_days ,:class_name => 'Admin::DealOfDay'
    belongs_to :user
    has_and_belongs_to_many :sizes, class_name: 'Admin::Size'
    has_and_belongs_to_many :colors, class_name: 'Admin::Color'
    # has_attached_file :avatar, styles: {thumbnail: "60x60#"}
    # validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    accepts_nested_attributes_for :images ,reject_if: proc{ |attributes| attributes['avatar'].blank?}
    accepts_nested_attributes_for :sizes
    accepts_nested_attributes_for :colors 
    extend FriendlyId
      friendly_id :name, use: :slugged
    translates :name, :description

    SORT_OPTIONS = [["asc_price", "Price: Lowest first"], ["desc_price", "Price: Highest first"], ["asc_name", "Product Name: A to Z"], ["desc_name", "Product Name: Z to A"], ["in_stock", "In Stock"]]

    def self.filter_search(params, products)
      products = products.find_by_colors(products, params[:colors_ids]) if params[:colors_ids].present?
      products = products.find_by_sizes(products, params[:sizes_ids]) if params[:sizes_ids].present?
      products = products.find_by_price(products, params[:min_price], params[:max_price]) if params[:min_price].present? and params[:max_price].present?
      return products
    end


    def self.find_by_colors(products, colors_ids)
      products = products.joins(:colors).where("admin_colors_products.color_id IN (?)", colors_ids).try(:uniq)
    end

    def self.find_by_sizes(products, sizes_ids)
      products = products.joins(:sizes).where("admin_products_sizes.size_id IN (?)", sizes_ids).try(:uniq)
    end

    def self.find_by_price(products, min_price, max_price)
      products = products.where("price >= ? AND price <= ?", min_price, max_price)
    end

  end
end
 