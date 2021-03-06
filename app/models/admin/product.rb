module Admin
	class Product < ActiveRecord::Base
    include PgSearch
    multisearchable :against => [:name, :user_id],  using: {
      tsearch: { prefix: true},
      trigram: {}
    }
    pg_search_scope :size_search, :associated_against => {
      :sizes => [:name],
    }
    scope :sort_by_update, -> { order(updated_at: :desc) }
    validates_numericality_of :price, :greater_than => 0, :less_than => 2147483646
    validates_numericality_of :discounted_price, :greater_than => 0, :less_than => 2147483646, :allow_blank => true
		self.table_name = 'admin_products'
    has_and_belongs_to_many :categories, class_name: 'Admin::Category'
		has_many :images ,as: :imageable, dependent: :destroy
		has_many :line_items
		has_many :deal_of_days ,:class_name => 'Admin::DealOfDay',dependent: :destroy
		belongs_to :user
		has_and_belongs_to_many :sizes, class_name: 'Admin::Size'
		has_and_belongs_to_many :colors, class_name: 'Admin::Color'
		# has_attached_file :avatar, styles: {thumbnail: "60x60#"}
		# validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
		accepts_nested_attributes_for :images
		accepts_nested_attributes_for :sizes
		accepts_nested_attributes_for :colors 
    accepts_nested_attributes_for :categories
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

    def self.other_filter_sort(products,sort)
      puts case sort
       when 'asc_name'
         products = products.sort_by( &:name)
       when 'desc_name'
         products = products.sort_by( &:name).reverse
       when 'desc_price'
         products = products.sort_by( &:price).reverse
       when 'asc_price'
         products = products.sort_by( &:price)
       else
        products=products
      end 
    return products
  end

  end
end
 