# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Role.create(name: 'vendoradmin')
user = User.create(:email => 'admin@democommerce.com',:name=> 'superadmin',:password => '12345678',:password_confirmation  => '12345678')
user.roles<<Role.create(:name=>'superadmin')
Store.create()



10.times do
	address = 'joher town, lahore punjab pakistan '
	u = User.create(name: Faker::Company.name, location: address,email:  Faker::Internet.email,popular: true, free_delivery: true, password: '12345678')
	u.add_role :vendoradmin
	5.times do
		u.products.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, discounted_price: Faker::Commerce.price ,description: Faker::Lorem.sentence(rand(2..10)), featured: true, homepage: true)
	end
end
