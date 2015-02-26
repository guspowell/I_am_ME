// When we move the code from event to calendar, we will need to rename this file
// to calendar_spec.js

describe('Calendar', function() {
  it("it appends sections with class day to the Calendar section", function() {
    // var calendarBuilder = new CalendarBuilder();
    buildCalendar();
    expect($("<section class='calendar'></section>")).toContainHtml("<section class='day'></section>");
  });
});
