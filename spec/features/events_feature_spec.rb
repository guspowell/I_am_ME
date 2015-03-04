require 'rails_helper'
# NOTE: To run this spec you need to have chromedriver. Follow error instructions
# And download it to /usr/bin

feature 'Event' do

  context 'When I want to view an event from this week' do

    scenario 'I can see a small widget' do
      user = create(:user)
      event= create(:event)
      user.get_me_calendar.events << event
      login_as(user)
      
      visit user_calendar_path(user, user.get_me_calendar) 

      expect(page).to have_content event.name
    end

    scenario 'I can click to see a big widget with more information', js: true, :driver => :selenium do
      user = create(:user)
      event= create(:event)
      user.get_me_calendar.events << event

      login_as(user)
      find('img.more').click
      
      expect(find('img.me').visible?).to eq(true)
    end
  end

  context 'When I want to view an event happening in another week' do

    scenario 'I can click the right arrow to view the next week' do
      user = create(:user)
      event= create(:event, date: (DateTime.now.change({min: 0, hour: 12}) + 7))
      user.get_me_calendar.events << event

      login_as(user)
      click_link 'arrow-next'
      
      expect(page).to have_content event.name
    end
  end

  context 'When I want to create an event' do

    scenario 'I can fill in a form to do so' do
      user = create(:user) 
      create(:calendar, user: user)
      login_as(user)
      visit "/users/#{user.id}/events/new"

      attrs = attributes_for(:event)
      fill_in_event_form(attrs)
      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")
      click_button 'Create Event'

      expect(page).to have_content(attrs[:name])
    end
  end

  context 'When I want to delete an event' do 

    scenario 'I can click delete within the edit event page' do 
      user  = create(:user) 
      event = create(:event, name: 'Hippy Jam')
      user.get_me_calendar.events << event

      click_link 'Edit'
      click_link 'Delete'
      visit '/'

      expect(page).not_to have_content('Hippy Jam')
    end 
  end
end


