
$(document).ready(function(){


  // $.get( "http://localhost:3000/events/4", function( event ) {

  // $( ".title, .title2" )
  //   .text( event.name )

  // $(".description")
  //   .text( event.description )

  // $(".location2")
  //   .text( event.location )

  // }, "json" )

  $(".expanded").hide();
  $("#map-canvas").hide();

  $(".more").click(function(){
      $(".widget").toggleClass("active");
      $(".expanded").toggle();
      $(".title").toggle();
      $(".location").toggle();
      $(".me").toggle();
  });

  $(".map").click(function(){
    $("#map-canvas").toggle();
  });
      
});



     