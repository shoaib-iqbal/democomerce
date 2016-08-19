function fetch_specfic_vendor_items(path,id)
{

	$.ajax({
	 url: path,
     data: {"user_id" : id},
      type: "get",
      format : 'js',
     success: function() {

      
     }
   });
}

