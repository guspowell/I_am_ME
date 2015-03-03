$(document).ready(function() {

  function initialize() {

    $('.map').click(function() {
      var widget = $(this).closest("[class^='widget']").find('#map-canvas').get(0);
      $(widget).show();
      
      if($(this).hasClass('hide')){
        console.log("hide")
        $(widget).hide();
        $(this).addClass('show').removeClass('hide');

      }
      else {
        console.log("showwww")
      
        var mapOptions = {
          center: { lat: 51.517369, lng: -0.073602},
          zoom: 15
        };
        
        var map = new google.maps.Map(widget, mapOptions);
        $(this).addClass('hide').removeClass('show');

      }
  

    });

  }

  google.maps.event.addDomListener(window, 'load', initialize);

});