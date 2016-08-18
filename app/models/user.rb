class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products,class_name: 'Admin::Product'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
 