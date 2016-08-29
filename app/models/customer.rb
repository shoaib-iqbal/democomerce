class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates:first_name, presence: true, length: { maximum: 50 }
  validates:last_name, presence: true, length: { maximum: 50 }
  validates:phone_number, presence: true, length: { maximum: 15 }
  validates:mobile_number, presence: true, length: { maximum: 15 }
  has_many :addresses
  has_many :orders
  belongs_to :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :addresses
end
