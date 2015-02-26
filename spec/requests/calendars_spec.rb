require 'rails_helper'

RSpec.describe "Calendars", type: :request do
  describe "GET users/user_id/calendars/calendar_id" do

    pending "serves JSON with information about the calendar and an array of events" do
      user     = create(:user)
      calendar = create(:calendar, user: user)
      event1   = create(:event, calendar: calendar)
      event2   = create(:event, calendar: calendar)


      events_ids = calendar.events.map {|event| event.id }
      get "/users/#{user.id}/calendars/#{calendar.id}.json"

      expect_json({name: calendar.name, events: events_ids })
    end
  end
end
