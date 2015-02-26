alert("jQuery is")

$(document).ready (

  $.get( "http://localhost:3000/events/5", function( event ) {

    $( ".title, .title2" )
        .text( event.name )

    $(".description")
        .text( event.description )

    $(".location2")
        .text( event.location )

  }, "json" )

 );
