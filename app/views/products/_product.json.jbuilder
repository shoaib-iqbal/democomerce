
 json.id			product.id
 json.name 			product.name
 json.images		product.images.each do |image|
 json.image 		"http://192.168.15.168:3000/"+product.images.first.avatar.url(:thumbnail)
 end
 json.price			product.price