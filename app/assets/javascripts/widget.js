// alert("jQuery is")

var appendWidgetFromAPI = function() {

  $.get( "http://localhost:3000/events/5", function( event ) {

   $( ".title, .title2" )
     .text( event.name )

   $(".description")
     .text( event.description )

   $(".location2, .location")
     .text( event.location )

   }, "json" )

}

var popoutWidgetEffect = function() {

  $(".hidden").hide();

  $(".more").click(function(){
      $(".frame").toggleClass("active");
      $(".hidden").toggle();
      $(".title").toggle();
      $(".location").toggle();
      $(".me").toggle();
  });

}

$(document).ready(function(){

  popoutWidgetEffect()

  appendWidgetFromAPI()

});
