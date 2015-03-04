$(document).ready(function() {

  function initialize() {

    $('.map').click(function() {
      var widget = $(this).closest("[class^='widget']").find('#map-canvas').get(0);
      $(widget).show();
      var play = $(this).closest("[class^='widget']").find('.play').get(0);
      $(play).hide();
      var more = $(this).closest("[class^='widget']").find('.more').get(0);
      $(more).hide();
      
      if($(this).hasClass('hide')){

        $(widget).hide();
        $(play).show();
        $(more).show();
        $(this).addClass('show').removeClass('hide');

      }

      else {

        var mapOptions = {
          center: { lat: 51.517369, lng: -0.073602},
          zoom: 15
        };
        
        var map = new google.maps.Map(widget, mapOptions);
        $(this).addClass('hide').removeClass('show');

        var location = $(this).closest("[class^='widget']").find('.location').html();

        var geocoder = new google.maps.Geocoder();

        geocoder.geocode( { 'address': location}, function(results, status) {
          
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
          } 

          else {
            alert("Geocode was not successful for the following reason: " + status);
          }
        });
      }
    });

  }

  google.maps.event.addDomListener(window, 'load', initialize);

});