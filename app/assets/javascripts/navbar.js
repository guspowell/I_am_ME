$(document).ready(function() {

  var createCalBox = $('#background-blur');

  var showAddCal = function() {
    createCalBox.show();
    $('.add-cal').unbind();
    createCalBox.click(clickAway);
  }

  var hideAddCal = function(callback) {
    createCalBox.unbind();
    createCalBox.hide(2, bindAddCalClick);
  }

  var clickAway = function(e) {
    var container = $('#new-cal')
    
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      hideAddCal(bindAddCalClick);
    }
  }

  var bindAddCalClick = function() {
    $('.add-cal').click(showAddCal)
  }

  bindAddCalClick();
     
  $('.plus').click(function() {
    var createEventBox = $('#background-create-event');
    createEventBox.show();

    createEventBox.click(function (e)  {
      var container = $('form#new_event');

      if (!container.is(e.target) && container.has(e.target).length === 0) {
        createEventBox.hide();
        createEventBox.unbind();
      }
    });
  });


});
