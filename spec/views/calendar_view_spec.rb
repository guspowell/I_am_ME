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
  end
end
