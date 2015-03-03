$(document).ready(function() {

  function initialize() {

    $('.map').click(function() {
      var widget = $(this).closest("[class^='widget']").find('#map-canvas').get(0);
      $(widget).show();
      var des = $(this).closest("[class^='widget']").find('.description').get(0);
      $(des).hide();
      var play = $(this).closest("[class^='widget']").find('.play').get(0);
      $(play).hide();
      var more = $(this).closest("[class^='widget']").find('.more').get(0);
      $(more).hide();
      var title = $(this).closest("[class^='widget']").find('.title').get(0);
      $(title).hide();
      
      if($(this).hasClass('hide')){
        console.log("hide")
        $(widget).hide();
        $(des).show();
        $(play).show();
        $(more).show();
        $(title).show();
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