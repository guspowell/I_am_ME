console.log("Hi Demkiw!");

var numberOfhours = 24;
var numberOfDays = 7; 


$(document).ready(function(){
  buildCalendar();
  buildWidgetSection();
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

var buildWidgetSection = function(date, hour){
  var widgetSection = $.parseHTML()
  $(widgetSection).appendTo($('div#hour1.hours'))
};

var buildWidgetThumbnail = function(){ 
  var thumbnailDiv =  $.parseHTML("<div class='thumbnail'> <a href='#'></a><a href='#'></a><h1 class='title'>ffdsahjkgf</h1><h2 class='location'>Jazz Cafe</h2><a href='#'></a></div>")
  $(thumbnailDiv).appendTo($('.day#day1.hours#hour2'))
};

var buildWidgetExpand = function(day) {
  var expandedDiv = document.createElement('div');
};

var buildWidgetBottom = function(day) {
  var expandedInfoDiv = document.createElement('div');
};