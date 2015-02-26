console.log("Hi Demkiw!");

var numberOfhours = 24;
var numberOfDays = 7; 

$(document).ready(function(){
  buildCalendar();
  buildWidgetThumbnail();
});

var buildHourUnit = function(hour, day){
  var hourDiv = document.createElement('div');
  return $(hourDiv).attr('class', 'hours').attr('id', "hour" + hour);
};

var buildDayUnit = function(day) {
  var daySection = document.createElement('section');
  return $(daySection).attr('class', "day").attr('id', "day" + day);
};

var buildCalendar = function(){
  var days  = 1;
  var hours;
  
  while(days <= numberOfDays){
    var hours = 1;
    var day = buildDayUnit(days).appendTo($('div#calendar'));

    while(hours <= numberOfhours){
      buildHourUnit(hours, days).appendTo(day);
      hours++;
    }
    days++;
  }
};

var buildWidgetThumbnail = function(){ 
  var thumbnailDiv =  $.parseHTML("<div class='thumbnail'> <h1> flerp derp </h1><a href='#'></a></div>")
  $(thumbnailDiv).appendTo($('div#hour1.hours'))
};

// var buildFrameUnit = function(frameNumber){
//   var frameDiv = document.createElement('div');
//     $(frameDiv).addClass('frame').attr('id', frameNumber).appendTo($('#frame-holder'));
//     $form = $("<form></form>");
//     $form.append('<input type="text" id="second-box' + frameNumber + '" class="second-roll">');
//     $form.append('<input type="text" id="first-box' + frameNumber + '" class="first-roll">');
//     $(frameDiv).append($form);
//     $(frameDiv).append('<p class="score" id="score'+frameNumber +'">??</p>')
// };