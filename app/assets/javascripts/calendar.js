$(document).ready(function() {

  var number = 0;
  console.log(number);

  $('.plus').click(function(){
    
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





var clock_div = $('#clock').offset().top, $window = $(window);

  $(function(){
    if($(window).width() > 480){
      $(this).scrollTop(0);
      $(document).scroll(function(){
        if($(this).scrollTop() >= (100 - clock_div) ){
            time = '01:00';
        }
        if($(this).scrollTop() >=  (200 - clock_div) ){
            time = '02:00';
        }
        if($(this).scrollTop() >=  (367 - clock_div) ){
            time = '03:00';
        }
        if($(this).scrollTop() >=  (534 - clock_div) ){
            time = '04:00';
        }
        if($(this).scrollTop() >=  (701 - clock_div) ){
            time = '05:00';
        }
        if($(this).scrollTop() >=  (868 - clock_div) ){
            time = '06:00';
        }
        if($(this).scrollTop() >=  (1035 - clock_div) ){
            time = '07:00';
        }
        if($(this).scrollTop() >=  (1202 - clock_div) ){
            time = '08:00';
        }
        if($(this).scrollTop() >=  (1369 - clock_div) ){
            time = '09:00';
        }
        if($(this).scrollTop() >=  (1536 - clock_div) ){
            time = '10:00';
        }
        if($(this).scrollTop() >=  (1703 - clock_div) ){
            time = '11:00';
        }
        if($(this).scrollTop() >=  (1870 - clock_div) ){
            time = '12:00';
        }
        if($(this).scrollTop() >=  (2037 - clock_div) ){
            time = '13:00';
        }
        if($(this).scrollTop() >=  (2204 - clock_div) ){
            time = '14:00';
        }
        if($(this).scrollTop() >=  (2371 - clock_div) ){
            time = '15:00';
        }
        if($(this).scrollTop() >=  (2538 - clock_div) ){
            time = '16:00';
        }
        if($(this).scrollTop() >=  (2705 - clock_div) ){
            time = '17:00';
        }
        if($(this).scrollTop() >=  (2872 - clock_div) ){
            time = '18:00';
        }
        if($(this).scrollTop() >=  (3039 - clock_div) ){
            time = '19:00';
        }
        if($(this).scrollTop() >=  (3206 - clock_div) ){
            time = '20:00';
        }
        if($(this).scrollTop() >=  (3373 - clock_div) ){
            time = '21:00';
        }
        if($(this).scrollTop() >=  (3540 - clock_div) ){
            time = '22:00';
        }
        if($(this).scrollTop() >=  (3707 - clock_div) ){
            time = '23:00';
        }
        if($(this).scrollTop() >=  (3874 - clock_div) ){
            time = '00:00';
        }
        $('#clock h3 span').text( time );
      });
    };
  });

  $(window).scroll(function() {  
    $("#clock").fadeIn();   
  });

  });
