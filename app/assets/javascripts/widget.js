console.log("Hi Demkiw Widget!");

var buildWidgetSection = function(date, hour){
  var widgetSection = document.createElement('section');
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






  // <section class='widget'>

    // <div class="thumbnail">
    //   <a href='#'><%= image_tag("more_info.png", :class => 'more') %></a>
    //   <a href='#'><%= image_tag("play.png", :class => 'play') %></a>
    //   <h1 class='title'>ffdsahjkgf</h1>
    //   <h2 class='location'>Jazz Cafe</h2>
    //   <a href='#'><%= image_tag("ME.gif", :class => 'me') %></a>
    // </div>

  //   <div class ='expanded'>
  //     <div class="top">
  //       <h1 class="title">Rebecca Ferguson</h1>
  //       <h2 class="description">Taylor is playing some sick tuness, and it is going to be a sick part with loads of fun people and beers and stuff<h2>
  //       <HR>
  //     </div>
  //     <div class="expanded-info">
  //       <a href='#'><%= image_tag("ME.gif", :class => 'me2') %></a>
  //       <h2><a href='#'><%= image_tag("map.svg", :class => 'map') %></a>London</h2>
  //       <h2><a href='#'><%= image_tag("price_tag.svg", :class => 'price') %></a>£800</h2>
  //       <h2><a href='#'><%= image_tag("share.svg", :class => 'share') %></a>Share</h2>
  //     </div>
  //   </div>

  // </section>