$(document).ready(function() {
	
	//login and signup
    $("#div2").hide();
    $("#link1").on("click",function() {
        $("#div1").show();
        $("#div2").hide();
    });

    $("#link2").on("click",function() {
        $("#div2").show();
        $("#div1").hide();
    });

    // reset modal data on modal close
    $(".modal").on("hidden.bs.modal", function(){
    	$("#div1").show();
        $("#div2").hide();
        $(".modal .title-row #link1").addClass('current');
        $(".modal .title-row #link2").removeClass('current');
	});

    // current state for modal buttons
    $(".modal .title-row .btn-default").on("click",function() {
    	$(".modal .title-row .btn-default").removeClass('current');
        $(this).addClass('current');
    });

	//owl carousel
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	});

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



}); // document.ready ends

