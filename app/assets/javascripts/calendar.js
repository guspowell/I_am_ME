console.log("Hi Demkiw!");

var numberOfhours = 24;
var numberOfDays = 7; 

$(document).ready(function(){
  buildCalendar();
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