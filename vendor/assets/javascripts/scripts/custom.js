$(document).ready(function() {
  
  //login and signup
    $("#div2").hide();
    $(".trigger-signin").hide();
    $(".title-signup").hide();
    $("#link1").on("click",function() {
        $("#div1").show();
        $("#div2").hide();
    });
    
    $(".link1").click(function(event) {
      event.preventDefault();
        $("#div2").show();
        $("#div1").hide();
        $(".trigger-signin").show();
        $(".trigger-signup").hide();
        $(".title-signup").show();
        $(".title-signin").hide();
    });

    $("#link2").on("click",function() {
        $("#div2").show();
        $("#div1").hide();
    });

    $(".link2").click(function(event) {
      event.preventDefault();
        $("#div1").show();
        $("#div2").hide();
        $(".trigger-signin").hide();
        $(".trigger-signup").show();
        $(".title-signup").hide();
        $(".title-signin").show();
    });

    // reset modal data on modal close
    $(".modal").on("hidden.bs.modal", function(){
      $("#div1").show();
        $("#div2").hide();
        $(".title-signup").hide();
        $(".title-signin").show();
        $(".trigger-signin").hide();
        $(".trigger-signup").show();
        //$(".modal .title-row #link1").addClass('current');
        //$(".modal .title-row #link2").removeClass('current');
  });

    // current state for modal buttons
    $(".modal .title-row .btn-default").on("click",function() {
      $(".modal .title-row .btn-default").removeClass('current');
        $(this).addClass('current');
    });

  //owl carousel
  // $('.owl-carousel').owlCarousel({
  //     loop:true,
  //     margin:10,
  //     nav:true,
  //     responsive:{
  //         0:{
  //             items:1
  //         },
  //         600:{
  //             items:3
  //         },
  //         1000:{
  //             items:5
  //         }
  //     }
  // });

   

     $(".owl-carousel").owlCarousel({

        autoPlay: 3000, //Set AutoPlay to 3 seconds
        dots: true,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 1]
    });
       

    /* ////////////////////////////
     show more/less code
     ///////////////////////////*/

      $('ul.collapseli').wrap('<div class="collapseWrapper">');
    $('div.collapseWrapper').css({ 'height' : '120px' }).after('<a href="#" class="collapseMore">Show More</a>');
     
    $('a.collapseMore').click(function () {
        if ($(this).hasClass('expanded')) {
            $(this).prev().animate({ height: '120px' }, 500);
            $(this).text('Show More').removeClass('expanded');
        }
        else {
            $(this).prev().animate({ height: $(this).prev().find('ul.collapseli').outerHeight(true) }, 500);
            $(this).text('Show Less').addClass('expanded');
        }
        return false;
    });

    // ///////////////////////////////
    //  sticky sidebar code
    //  ///////////////////////////////


  // cancel anchor click page reload
  $('.go-to-menu li a').click(function(event) {
    event.preventDefault();
  });  

  // on li click remove active class from all li elements but then add to li that was clicked that we have in (this)
  $('.go-to-menu li').click(function() {
      $('.go-to-menu li').removeClass('active');
      $(this).addClass('active');
  }); 


  // on clicking id animate body to target id
  $("#golink1").click(function() {
      $('html, body').animate({scrollTop: $("#link1").offset().top}, 400);
  });
  $("#golink2").click(function() {
      $('html, body').animate({scrollTop: $("#link2").offset().top}, 400);
  });
  $("#golink3").click(function() {
      $('html, body').animate({scrollTop: $("#link3").offset().top}, 400);
  });
  $("#golink4").click(function() {
      $('html, body').animate({scrollTop: $("#link4").offset().top}, 400);
  });


///////////////////////////////////////////////////////////////////







     // checkout-page-2---radio--show/hide
     $(".settime").hide();
    $(".settimehide").click(function(){
        $(".settime").hide();
    });
    $(".settimeshow").click(function(){
        $(".settime").show();
    });


 // chechout page 3== div.show/hide
    $(".second-block").hide();
    $(".second-option").hide();
    $(".setchange1").click(function(){
        $(".second-option").hide();
        $(".first-option").show();
        $(".first-block").show();
        $(".second-block").hide();
    });

    $(".setchange2").click(function(){
        $(".second-option").show();
        $(".first-option").hide();
        $(".first-block").hide();
        $(".second-block").show();
    });









    if($(window).width() <= 960) {
       $('.filters-area .list-unstyled').hide();
       $('.stores-list .list-unstyled').hide();
    }
    else
    {
      $('.filters-area .list-unstyled').show();
      $('.stores-list .list-unstyled').show();
    }


    $(".list-1-js").click(function(){
        $('.filters-area .list-unstyled').toggle();
    });

    $(".list-2-js").click(function(){
        $('.stores-list .list-unstyled').toggle();
    });








}); // document.ready ends





$(window).on('resize', function() {
      if($(window).width() <= 960) {
       $('.filters-area .list-unstyled').hide();
       $('.stores-list .list-unstyled').hide();
    }
    else
    {
      $('.filters-area .list-unstyled').show();
      $('.stores-list .list-unstyled').show();
    }
});  







// document.ready starts again
$(document).ready(function() {
    // if($(window).width() > 960) {

    //     var stickyTop = $('.go-to-menu').offset().top;

    //     $(window).on( 'scroll', function(){
    //         if ($(window).scrollTop() >= stickyTop) {
    //             $('.go-to-menu').css({position: "fixed", top: "0px"});
    //         } else {
    //             $('.go-to-menu').css({position: "relative", top: "0px"});
    //         }
    //     });

    // } 
}); // document.ready ends