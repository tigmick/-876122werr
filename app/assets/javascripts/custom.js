$(window).ready(function() {
 function showHeight( element, height ) {
	$( ".banner" ).css("min-height" , height - 50 );
	
}	
showHeight( "window", $( window ).height()  );
});

$(window).resize(function() {
 function showHeight( element, height ) {
	$( ".banner" ).css("min-height" , height - 50 );
}	
showHeight( "window", $( window ).height() );
});



$(".navi").click(function(){
 $("body").toggleClass("nav_open");
});
$("nav .nav > li > a").click(function(){
 $("body").removeClass("nav_open");
});

$("nav .form-group").click(function(){
	$("nav.navbar.navbar-default").toggleClass("nav_open");
});
