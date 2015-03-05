$(document).ready(function() {

var timer;
$(document).mousemove(function() {
    if (timer) {
        clearTimeout(timer);
        timer = 0;
    }

    $(".left-arrow").fadeIn(1000);
    $(".right-arrow").fadeIn(1000);
    timer = setTimeout(function() {
        $(".left-arrow").fadeOut(1000);
        $(".right-arrow").fadeOut(1000);
    }, 1500)
})



  // $(window).mousemove(function() {
  //   $(".left-arrow").fadeIn(1000);
  //   $(".right-arrow").fadeIn(1000);
  // });

  // clearTimeout(timer);

  // timer = setTimeout(function() {
  //   console.log("PENIS");
  //   $(".left-arrow").fadeOut();
  //   $(".right-arrow").fadeOut();
  // }, 6000);

});
