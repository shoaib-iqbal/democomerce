class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products,class_name: 'Admin::Product'
  has_many :sizes,class_name: 'Admin::Size'
  has_many :colors,class_name: 'Admin::Color'
  has_many :categories,class_name: 'Admin::Category'
  has_many :line_items
  
  has_attached_file :avatar, styles: {thumbnail: "170x88"},
  :reject_if => lambda { |t| t['avatar'].nil? }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  translates :name, :location
  
   
   geocoded_by :full_street_address, latitude: :lat, longitude: :lng
   after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

   def full_street_address
     #convert address to geocoded values
     "#{self.location}"
   end
     def clearance_levels
    # Array of role names
    roles.pluck(:name)
  end

   def superadmin?
   	if self and self.has_role? :superadmin
   		return true
   	else
   		return false
   	end
   end
end
 