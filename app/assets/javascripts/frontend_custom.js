$(document).ready(function(){

	function create_cart(product_id,quantity)
{

	$.ajax({
	 url: cart/,
     data: {"product_id" : product_id,"quantity" : quantity},
      type: "post",
      format : 'js',
     success: function() {

      
     }
   });
}

});