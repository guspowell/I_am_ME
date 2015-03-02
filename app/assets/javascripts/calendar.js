
$(document).ready(function(){

  $("#map-canvas").hide();

  $("#map").click(function(){
    $("#map-canvas").toggle();
    $(".widget-small").css("background-image", "transparent");
  });


  $('.more').click(function() {
    var widget = $(this).closest("[class^='widget']");
    var widgetClass;
    
    if (widget.attr('class') === 'widget-small') {
      widgetClass = enlargeWidget(widget);
    }
    if (widget.attr('class') === 'widget-large') {
      widgetClass = shrinkWidget(widget);
    }
    
    widget.attr('class', widgetClass);
  });

  var enlargeWidget = function(widget) {
    var scopedWidgetWidth  = $(widget).width();
    var scopedWidgetHeight = $(widget).height();
    
    widget.animate({height: scopedWidgetHeight*3 + 'px'}, 250);
    widget.animate({width: scopedWidgetWidth*1.65 + 'px'}, 250);
    
    return  'widget-large'; 
  }

  var shrinkWidget = function(widget) {
    var scopedWidgetWidth  = $(widget).width();
    var scopedWidgetHeight = $(widget).height();
    
    widget.animate({height: scopedWidgetHeight/3 + 'px'}, 250);
    widget.animate({width: scopedWidgetWidth/1.65 + 'px'}, 250);
    
    return 'widget-small'; 
  }
});
