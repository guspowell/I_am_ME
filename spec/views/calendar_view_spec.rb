require 'rails_helper'

feature 'Calendar View' do

 context 'When displaying events' do

   scenario 'events occurring at any hour can be displayed' do
     user = create(:user) 
     login_as(user)

     24.times do |hour| 
       event = create(:event, name: "EventNumber#{hour+1}", 
                      date: DateTime.now.change({hour: hour+1}))
       user.calendars.me.events << event
       visit user_calendar_path(user, user.calendars.me)
       expect(page).to have_content event.name
     end
   end

   scenario 'events can display on any day of the week' do
     user = create(:user)
     login_as(user)
     datetime = DateTime.now.beginning_of_week
     
     7.times do |day|
              event = create(:event, name: "EventDay#{day+1}",
                      date: datetime) 
       user.calendars.me.events << event
       visit user_calendar_path(event, user.calendars.me)
       expect(page).to have_content event.name
       datetime = datetime.next_day
     end
   end

   scenario 'events can display on Sunday' do
     user = create(:user)
     login_as(user)
     datetime = DateTime.now.end_of_week

     24.times do |hour| 
       event = create(:event, name: "EventNumber#{hour}", 
                      date: datetime.change({hour: hour}))
       user.calendars.me.events << event
       visit user_calendar_path(user, user.calendars.me)
       expect(page).to have_content event.name
     end
   end
  end
end
