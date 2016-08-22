
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
