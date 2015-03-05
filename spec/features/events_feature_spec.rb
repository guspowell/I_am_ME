require_relative './init'

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
      event= create(:event, user: user)
      user.get_me_calendar.events << event

      login_as(user)
      find('img.more').click
      
      expect(find('img#edit').visible?).to eq(true)
    end
  end

  
  context 'When I want to create an event' do

    scenario 'I can fill in a form to do so' do
      user = create(:user) 
      login_as(user)
      visit "/users/#{user.id}/events/new"

      attrs = attributes_for(:event)
      fill_in_event_form(attrs)
      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")
      click_button 'submit'

      expect(page).to have_content(attrs[:name])
    end

    scenario 'I can specify which calendar to put it in' do
      user     = create(:user) 
      food_cal = create(:calendar, name: "Food")
      user.calendars << food_cal
      login_as(user)
      visit "/users/#{user.id}/events/new"

      attrs = attributes_for(:event, name: "Cocktail Party")
      fill_in_event_form(attrs)
      select("Food", from: "event[calendar_id]")
      click_button 'submit'

      visit user_calendar_path(user, food_cal)
      expect(page).to have_content "Cocktail Party" 
    end
  end

  context 'When I want to edit an event', js: true, :driver => :selenium do

    scenario 'I can for an event I created' do
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
      click_button 'submit'

      expect(page).to have_content 'Jamboree'
    end
  end

  context 'When I want to delete an event' do 

    scenario 'I created, I go to the edit event page', js: true, driver: :selenium do 
      user  = create(:user) 
      event = create(:event, name: 'Hippy Jam')
      user.get_me_calendar.events << event

      login_as(user) 
      find('img.more').click
      find('img#edit').click 
      click_link 'Delete'

      expect(page).not_to have_content('Hippy Jam')
    end 
  end
end


