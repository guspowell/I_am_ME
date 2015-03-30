$(document).ready(function() {

  var clock_div = $('#clock').offset().top, $window = $(window);

  $(function(){
    if($(window).width() > 480){
      $(this).scrollTop(0);
      $(document).scroll(function(){
        if($(this).scrollTop() >= (clock_div) ){
            time = '01:00';
        }
        if($(this).scrollTop() >=  (100 - clock_div) ){
            time = '02:00';
        }
        if($(this).scrollTop() >=  (250 - clock_div) ){
            time = '03:00';
        }
        if($(this).scrollTop() >=  (400 - clock_div) ){
            time = '04:00';
        }
        if($(this).scrollTop() >=  (550 - clock_div) ){
            time = '05:00';
        }
        if($(this).scrollTop() >=  (700 - clock_div) ){
            time = '06:00';
        }
        if($(this).scrollTop() >=  (850 - clock_div) ){
            time = '07:00';
        }
        if($(this).scrollTop() >=  (1000 - clock_div) ){
            time = '08:00';
        }
        if($(this).scrollTop() >=  (1150 - clock_div) ){
            time = '09:00';
        }
        if($(this).scrollTop() >=  (1300 - clock_div) ){
            time = '10:00';
        }
        if($(this).scrollTop() >=  (1450 - clock_div) ){
            time = '11:00';
        }
        if($(this).scrollTop() >=  (1600 - clock_div) ){
            time = '12:00';
        }
        if($(this).scrollTop() >=  (1750 - clock_div) ){
            time = '13:00';
        }
        if($(this).scrollTop() >=  (1900 - clock_div) ){
            time = '14:00';
        }
        if($(this).scrollTop() >=  (2050 - clock_div) ){
            time = '15:00';
        }
        if($(this).scrollTop() >=  (2200 - clock_div) ){
            time = '16:00';
        }
        if($(this).scrollTop() >=  (2350 - clock_div) ){
            time = '17:00';
        }
        if($(this).scrollTop() >=  (2500 - clock_div) ){
            time = '18:00';
        }
        if($(this).scrollTop() >=  (2650 - clock_div) ){
            time = '19:00';
        }
        if($(this).scrollTop() >=  (2800 - clock_div) ){
            time = '20:00';
        }
        if($(this).scrollTop() >=  (2950 - clock_div) ){
            time = '21:00';
        }
        if($(this).scrollTop() >=  (3100 - clock_div) ){
            time = '22:00';
        }
        if($(this).scrollTop() >=  (3250 - clock_div) ){
            time = '23:00';
        }
        if($(this).scrollTop() >=  (3400 - clock_div) ){
            time = '00:00';
        }
        $('#clock h3 span').text( time );
      });
    };
  });

  $(window).scroll(function() {
    $("#clock").fadeIn(1000);
    clearTimeout($.data(this, 'scrollTimer'));
    $.data(this, 'scrollTimer', setTimeout(function() {
        $("#clock").fadeOut(1000);
    }, 1500));
  });
  
});
