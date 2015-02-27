require 'rails_helper'

RSpec.describe "Calendars", type: :request do
  describe "GET users/user_id/calendars/calendar_id" do

    it "serves JSON with information about the calendar" do
      user     = create(:user)
      calendar = create(:calendar, user: user)
      event1   = create(:event, calendar: calendar)
      event2   = create(:event, calendar: calendar)

      get "/users/#{user.id}/calendars/#{calendar.id}.json"

      expect_json({name: calendar.name, start_date: Date.new(2015, 2, 3).strftime('%Y-%m-%d'),
                   events: [event1.id, event2.id]})
    end

   
      
  
  end
end

