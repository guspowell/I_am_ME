$(document).ready(function() {

  function initialize() {
    
    var mapOptions = {
      center: { lat: 51.517369, lng: -0.073602},
      zoom: 15
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});