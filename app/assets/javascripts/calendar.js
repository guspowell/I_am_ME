
$(document).ready(function(){

  $('.more').click(function() {
    var scopedWidget       = $(this).closest('.widget-small');
    
    var scopedWidgetWidth  = $(scopedWidget).width();
    var scopedWidgetHeight = $(scopedWidget).height();
    
    scopedWidget.animate({height: scopedWidgetHeight*3 + 'px'}, 250);
    scopedWidget.animate({width: scopedWidgetWidth*1.65 + 'px'}, 250);
    
    scopedWidget.attr('class', 'widget-large')
  });
      
});



     