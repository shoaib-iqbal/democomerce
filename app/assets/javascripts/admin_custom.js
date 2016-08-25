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

 $('.select').select2();
 $('#store_currency').select2();


function changelanguage(selected_language){


	$.ajax({
      url: '/home/set_session?lang='+selected_language,
      method: 'GET',
      success: function (data) {
        
         window.location.reload();
      }
  });
}

function saim(value){
  $.ajax({
      url: '/admin/get_color_and_size?vendor='+value,
      method: 'GET',
      success: function (data) {
        
        
      }
  });
  // alert(va);
}