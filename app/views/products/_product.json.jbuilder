
 json.id			product.id
 json.name 			product.name
 json.images		product.images
 json.image 		"http://192.168.15.168:3000/"+product.images.first.avatar.url(:thumbnail)
 json.price			product.price