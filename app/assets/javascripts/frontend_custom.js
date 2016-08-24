
function getProductDetail(element) {
 var id = $(element).find('input').val();
  $.ajax({
      url: '/products/'+id,
      method: 'GET',
      success: function (data) {
        
         $("#quickview-wrapper").html(data);
         $('#productModal').modal('show');
      }
  });
}
function changelanguage(selected_language){


	$.ajax({
      url: 'home/set_session?lang='+selected_language,
      method: 'GET',
      success: function (data) {
        
         window.location.reload();
      }
  });
}