require_relative './init'

# NOTE: To run this spec you need to have chromedriver. Follow error instructions
# And download it to /usr/bin
#

feature 'Event' do

  context 'When I want to view an event from this week' do

    scenario 'I can see a small widget' do
      user = create(:user)
      event= create(:event, user: user)
      user.get_me_calendar.events << event
      login_as(user)
      
      visit user_calendar_path(user, user.get_me_calendar) 

      expect(page).to have_content event.name
    end

    scenario 'I can click to see a big widget with more information', js: true, :driver => :selenium do
      user = create(:user)
      event= create(:event, user: user)
      user.get_me_calendar.events << event

      login_as(user)
      find('img.more').click
      
      expect(find('img#edit').visible?).to eq(true)
    end

  end

  
  context 'When I want to create an event', js: true, :driver => :selenium  do

    scenario 'I can fill in a form to do so' do
      user = create(:user) 
      login_as(user)

      find('img.plus').click
      attrs = attributes_for(:event)
      fill_in_event_form(attrs)
      click_button 'Submit'

      expect(page).to have_content(attrs[:name])
    end

    scenario 'I can specify which calendar to put it in' do
      user     = create(:user) 
      food_cal = create(:calendar, name: "Food")
      user.calendars << food_cal
      login_as(user)
      find('img.plus').click

      attrs = attributes_for(:event, name: "Cocktail Party")
      fill_in_event_form(attrs)
      select("Food", from: "event[calendar_id]")
      click_button 'Submit'

      visit user_calendar_path(user, food_cal)
      expect(page).to have_content "Cocktail Party" 
    end

    scenario 'I can click outside the create event form and be returned', js: true, :driver => :selenium do
      user = create(:user)
      login_as(user)

      visit user_calendar_path(user, user.get_me_calendar) 
      find('img.plus').click 
      page.execute_script("$(document.elementFromPoint(10, 10)).click();")

      expect(page).not_to have_css('#background-create-event')
    end
  end

  context 'When I want to change an event', js: true, :driver => :selenium do

    scenario 'I click edit to go to the edit event page' do
      user = create(:user)
      event= create(:event)
      user.get_me_calendar.events << event
      login_as(user)

      find('img.more').click
      click_link 'Edit' 

      expect(current_path).to eq edit_user_event_path user, event
    end

    scenario 'I can make changes in the edit event form' do
      user = create(:user)
      event = create(:event, user: user)
      login_as(user)

      visit edit_user_event_path(user, event)
      fill_in 'Name', with: 'Jamboree'
      click_button 'Submit'

      expect(page).to have_content 'Jamboree'
    end

    scenario 'I can delete the event on the edit event page' do
      user  = create(:user) 
      event = create(:event, name: 'Hippy Jam', user: user)
      user.get_me_calendar.events << event

      login_as(user) 
      visit edit_user_event_path(user, event)
      click_link 'Delete'

      expect(page).not_to have_content('Hippy Jam')
    end 

    scenario 'I cannot unless I created the event' do
      user  = create(:user)
      event = create(:event, name: 'Pumpkin Contest', 
                             user: create(:user, username: 'Charlie', email: 'charlie@email.com'))
      user.get_me_calendar.events << event 

      login_as(user)
      visit edit_user_event_path(user, event)
      click_link 'Delete'

      expect(page).to have_content event.name 
    end
    
    scenario 'After deletion, events no longer appear in search results' do



    end
  end
end

