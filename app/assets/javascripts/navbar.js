$(document).ready(function() {

  $('.add-cal').click(function() {
    var createCalBox = $('#background-blur');
    createCalBox.show();


    createCalBox.click(function (e)  {
      var container = $('#create-event-actions');
      console.log(container);

      if (!container.is(e.target) && container.has(e.target).length === 0) {
        createCalBox.hide();
        createCalBox.unbind();
      }
    });
  });




  $('.plus').click(function() {
    var createEventBox = $('#background-create-event');
    createEventBox.show();


    createEventBox.click(function (e)  {
      var container = $('form#new_event');
      console.log(container);

      if (!container.is(e.target) && container.has(e.target).length === 0) {
        createEventBox.hide();
        createEventBox.unbind();
      }
    });
  });


});
