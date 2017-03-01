$(window).resize(function() {
 function showHeight( element, height ) {
	$( ".banner" ).css("min-height" , height );
	
}	
showHeight( "window", $( window ).height() );
});

function showHeight( element, height ) {
	$( ".banner" ).css("min-height" , height );
	$( ".bg_bann .item" ).css("min-height" , height - 150);
}	
showHeight( "window", $( window ).height() );


$(".navi").click(function(){
 $("body").toggleClass("nav_open");
});
$("nav .nav > li > a").click(function(){
 $("body").removeClass("nav_open");
});