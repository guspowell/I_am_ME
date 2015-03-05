$(document).ready(function() {

  $('.add-cal').click(function() {
    $('#background-blur').show();
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
