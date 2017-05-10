class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products,class_name: 'Admin::Product'
  has_many :sizes,class_name: 'Admin::Size'
  has_many :colors,class_name: 'Admin::Color'
  has_many :categories,class_name: 'Admin::Category'
  has_many :line_items
  has_many :customers
  belongs_to :vendor_category
  

  has_attached_file :avatar, styles: {thumbnail: "170x88"},
  :reject_if => lambda { |t| t['avatar'].nil? }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  translates :name, :location
  
   
  geocoded_by :full_street_address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
  #LOCATION_OPTIONS = {'popular cities' =>  [[["Islamabad", "Karachi", "Lahore", "Rawalpindi"]], ['More Cities' => , ["Bahawalpur", "Faisalabad", "Faisalabad", "Gujranwala", "Hyderabad", "Jhelum", "Larkana"]]]}
  LOCATION_OPTIONS = {
 "popular cities" => ["Islamabad", "Karachi", "Lahore", "Rawalpindi"],
 "More Cities" => ["Bahawalpur", "Faisalabad", "Faisalabad", "Gujranwala", "Hyderabad", "Jhelum", "Larkana"]
}
   def full_street_address
     #convert address to geocoded values
     "#{self.location}"
   end
     def clearance_levels
    # Array of role names
    roles.pluck(:name)
  end
  def self.set_location(lat,long)
    geo_localization = "#{lat},#{long}"
    query = Geocoder.search(geo_localization).first
    street = self.find_street(query)
    byebug
    return "#{street}"+','+"#{query.city}"+','+"#{query.country}"
    #city = 
  end
  def self.find_street(query)
    query.data["address_components"].each do |component|
      if component["types"].include?("sublocality")
        street = component["long_name"]
        return street
      end
    end
   
  end

   def superadmin?
   	if self and self.has_role? :superadmin
   		return true
   	else
   		return false
   	end
   end
end
Vendor =  User
 