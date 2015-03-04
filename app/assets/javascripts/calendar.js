$(document).ready(function() {

  var number = 0;

  $('.plus').click(function(){
    return number += number +1
  });

  $('.more').click(function() {
    var widget = $(this).closest("[class^='widget']");
    var widgetClass;

    if (widget.attr('class') === 'widget-small' ) {
      widgetClass = enlargeWidget(widget);
    }
    if (widget.attr('class') === 'widget-page' ) {
      widgetClass = enlargeWidgetPage(widget);
    }
    if (widget.attr('class') === 'widget-large') {
      widgetClass = shrinkWidget(widget);
    }
    if (widget.attr('class') === 'widget-large-page') {
      widgetClass = shrinkWidgetPage(widget);
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

  var enlargeWidgetPage = function(widget) {
    var scopedWidgetWidth  = $(widget).width();
    var scopedWidgetHeight = $(widget).height();

    widget.animate({height: scopedWidgetHeight*3 + 'px'}, 250);
    widget.animate({width: scopedWidgetWidth*1.65 + 'px'}, 250);

    return  'widget-large-page';
  }

  var shrinkWidgetPage = function(widget) {
    var scopedWidgetWidth  = $(widget).width();
    var scopedWidgetHeight = $(widget).height();

    widget.animate({height: scopedWidgetHeight/3 + 'px'}, 250);
    widget.animate({width: scopedWidgetWidth/1.65 + 'px'}, 250);

    return 'widget-page';
  }



});
