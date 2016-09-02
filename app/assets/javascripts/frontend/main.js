(function ($) {
 "use strict";
/* Header Top JS */
 	$(".currencies-block-top .current").on('click', function(){
        $(".first-currencies").slideToggle();
		$(".first-languages").css("display","none");
		$(".header-bottom-search").css("display","none");
		$("#cart_list").css("display","none");
    });
	$(".languages-block-top .current").on('click', function(){
        $(".first-languages").slideToggle();
		$(".first-currencies").css("display","none");
		$(".header-bottom-search").css("display","none");
		$("#cart_list").css("display","none");
    });
	$(".search-icon").on('click', function(){
        $(".header-bottom-search").slideToggle();
		$(".first-currencies").css("display","none");
		$(".first-languages").css("display","none");
		$("#cart_list").css("display","none");
    });
    

    $(".mini-cart-icon").on('mouseover', function(){
    	$("#cart_list").show();
    	toggle_cart();
    });
        $(".mini-cart-icon").on('click', function(){
    	$("#cart_list").slideToggle();
    	toggle_cart();
    });

    $("#cart_list").on('mouseleave', function(){
    	$("#cart_list").hide();
    	toggle_cart();
    });

    function toggle_cart(){
    	// $("#cart_list").slideToggle();
        $(".header-bottom-search").css("display","none");
		$(".first-currencies").css("display","none");
		$(".first-languages").css("display","none");
    }

 /** Filter Shop Page ***/
  $(".filter-button-shop").click(function() {
 	$(".left-widget-content").toggle();
   });
 /* Search Letter */
	jQuery("#search-letter").on('focus', function(){
		if(jQuery(this).val()=="Enter your e-mail"){
			jQuery(this).val("");
		}
	});
	jQuery("#search-letter").on('focusout', function(){
		if(jQuery(this).val()==""){
			jQuery(this).val("Enter your e-mail");
		}
	});
	jQuery("#header-letter-btn").on("click", function(){
		if(jQuery("#search-letter").val()=="Enter your e-mail" || jQuery("#search-letter").val()==""){
			jQuery("#search-letter").on('focus');
			return false;
		}
	}); 
 
 /*----------------------------
	owl active Featured products 
------------------------------ */  
  $(".featured-product-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:false,
	  navigation:true,	  
      items : 4,
	  /* transitionStyle : "fade", */    /* [This code for animation ] */
	  navigationText:["<i class='fa fa-angle-double-left'></i>","<i class='fa fa-angle-double-right'></i>"],
      itemsDesktop : [1199,4],
	  itemsDesktopSmall : [991,3],
	  itemsTablet: [767,2],
	  itemsMobile: [479,1]
  });
    
 /*----------------------------
	owl active Featured products 
------------------------------ */  
  $(".featured-product-list2").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:false,
	  navigation:true,	  
      items : 3,
	  /* transitionStyle : "fade", */    /* [This code for animation ] */
	  navigationText:["<i class='fa fa-angle-double-left'></i>","<i class='fa fa-angle-double-right'></i>"],
      itemsDesktop : [1199,3],
	  itemsDesktopSmall : [991,3],
	  itemsTablet: [767,2],
	  itemsMobile: [479,1]
  });
  
 /*----------------------------
	owl active Deal products 
------------------------------ */  
  $(".deal-area-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:true,
	  navigation:false,	  
      items : 2,
      itemsDesktop : [1199,2],
	  itemsDesktopSmall : [991,1],
	  itemsTablet: [767,1],
	  itemsMobile: [479,1]
  });
  
 /*----------------------------
	owl active Category products 
------------------------------ */  
  $(".category-container-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:false,
	  navigation:false,	  
      singleItem : true
  });
    
 /*----------------------------
	owl active Testimonial 
------------------------------ */  
  $(".testimonial-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:true,
	  navigation:false,	  
      singleItem : true
  });
    
  /*----------------------------
	owl active Brand Area 
------------------------------ */  
  $(".brand-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:false,
	  navigation:false,	  
      items : 6,
      itemsDesktop : [1199,6],
	  itemsDesktopSmall : [991,4],
	  itemsTablet: [767,3],
	  itemsMobile: [479,2]
  });
    
  /*----------------------------
	owl active Blog Area 
------------------------------ */  
  $(".blog-list").owlCarousel({
      autoPlay: false, 
	  slideSpeed:2000,
	  pagination:false,
	  navigation:true,	  
      items : 3,
	  /* transitionStyle : "fade", */    /* [This code for animation ] */
	  navigationText:["<i class='fa fa-angle-double-left'></i>","<i class='fa fa-angle-double-right'></i>"],
      itemsDesktop : [1199,3],
	  itemsDesktopSmall : [991,3],
	  itemsTablet: [767,1],
	  itemsMobile: [479,1]
  });
/*---------------------
 countdown
--------------------- */
	$('[data-countdown]').each(function() {
	  var $this = $(this), finalDate = $(this).data('countdown');
	  $this.countdown(finalDate, function(event) {
		$this.html(event.strftime('<span class="cdown days"><span class="time-count">%-D</span> <p>Days</p></span> <span class="cdown hour"><span class="time-count">%-H</span> <p>Hour</p></span> <span class="cdown minutes"><span class="time-count">%M</span> <p>Min</p></span> <span class="cdown second"> <span><span class="time-count">%S</span> <p>Sec</p></span>'));
	  });
	});	 
/*---------------------
   scrollUp
--------------------- */	
	$.scrollUp({
        scrollText: '<i class="fa fa-arrow-up"></i>',
        easingType: 'linear',
        scrollSpeed: 1000,
        animation: 'fade'
    });	
/*----------------------------
 wow js active
------------------------------ */
 new WOW().init();
 
 
/*----------------------------
 price-slider active
------------------------------ */
if (window.location.pathname == '/products' ){

console.log('main')
	  $( "#slider-range" ).slider({
	   range: true,
	   min: min_price,
	   max: max_price,
	   values: [ min_price, max_price ],
	   slide: function( event, ui ) {
		$( "#amount" ).val( unit + ui.values[ 0 ] + " - "+unit + ui.values[ 1 ] );

	   },
     stop: function( event, ui ){
      $( "#min_price" ).val(ui.values[ 0 ]);
      $( "#max_price" ).val(ui.values[ 1 ]);
      console.log($( "#amount" ).val());
      $('#price_range_show').html('Price: '+ $('#amount').val())
      $('#submit').click();
     }

	  });
	  $( "#amount" ).val( unit + $( "#slider-range" ).slider( "values", 0 ) +
	   " - "+unit + $( "#slider-range" ).slider( "values", 1 ) );
	 
 
 }
/*-------------------------
	showlogin toggle function
--------------------------*/
	$( '#showlogin' ).on('click', function() {
		$( '#checkout-login' ).slideToggle(900);
	}); 

/*-------------------------
	showcoupon toggle function
--------------------------*/
	$( '#showcoupon' ).on('click', function() {
		$( '#checkout_coupon' ).slideToggle(900);
	});
	 
/*--------------------------------
	Create an account toggle function
---------------------------------*/
	$( '#cbox' ).on('click', function() {
		$( '#cbox_info' ).slideToggle(900);
	});
 
/*---------------------------------
	Create an account toggle function
---------------------------------*/
	$( '#ship-box' ).on('click', function() {
		$( '#ship-box-info' ).slideToggle(1000);
	});	

/* ---------------------------------
	payment-accordion
* ---------------------------------*/ 
	$(".payment-accordion").collapse({
		accordion:true,
		open: function() {
		this.slideDown(550);
		},
		close: function() {
		this.slideUp(550);
		}		
	});
	
/*---------------------
 venobox
--------------------- */
    $('.venobox').venobox(); 
	
/*----------------------------
	BX slider
------------------------------ */ 
	$('.bxslider').bxSlider({
		minSlides: 4,
		maxSlides: 4,
		slideWidth:270,	 
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		prevText: '<i class="fa fa-chevron-circle-left"></i>',
		nextText: '<i class="fa fa-chevron-circle-right"></i>'
	});	
 
/*----------------------------
	Input Plus Minus Button
------------------------------ */ 
    $(".cart-plus-minus").append('<div class="dec qtybutton">-</div><div class="inc qtybutton">+</div>');
    $(".qtybutton").on("click", function() {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() == "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find("input").val(newVal);
    });
	
    /*----------------------------
        jQuery MeanMenu
    ------------------------------ */
	jQuery('nav#dropdown').meanmenu();		
	
 
})(jQuery); 