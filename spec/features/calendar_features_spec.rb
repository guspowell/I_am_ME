require_relative './init'

feature 'Calendars' do

  context 'When I want to view a calendar' do

    scenario 'I can click a link and see my calendar' do
      user = create(:user)
      calendar = create(:calendar, name: "Sports", user: user)
      login_as(user)

      visit '/'
      click_link "Sports"

      expect(current_path).to eq "/users/#{user.id}/calendars/#{calendar.id}"
    end
  end

  context 'When I want to view a week in the future or past' do 

    let(:user) { create(:user) }

    scenario 'I can click the right arrow to view the next week' do
      event= create(:event, date: (DateTime.now.change({min: 0, hour: 12}) + 7))
      user.get_me_calendar.events << event

      login_as(user)
      click_link 'arrow-next'
      
      expect(page).to have_content event.name
    end

    scenario 'I can click the left arrow to view the previous week' do
      event= create(:event, date: (DateTime.now.change({min: 0, hour: 12}) - 7))
      user.get_me_calendar.events << event

      login_as(user)
      click_link 'arrow-previous'
      
      expect(page).to have_content event.name
    end
  end

  context 'When I want to create a calendar' do

    scenario 'I can click a link and do so' do
      user = create(:user)
      login_as(user)

      visit user_calendar_path(user, user.get_me_calendar) 
      click_link 'Add Calendar' 
      fill_in 'name', with: 'Sports'
      click_button 'Create'

      sports_cal = Calendar.find_by(name: 'Sports')
      expect(current_path).to eq user_calendar_path user, sports_cal
    end
  end

  context 'When I want to add an event to my calendar' do

    scenario 'I can add an event from another of my calendars to my ME calendar', js: true, :driver => :selenium do
      user        = create(:user)
      sports_cal  = create(:calendar, name: "Sports")
      event       = create(:event, name: "Arsenal vs Chelsea")
      sports_cal.events << event
      user.calendars << sports_cal
      login_as(user)

      visit user_calendar_path(user, sports_cal) 
      find('img.more').click
      find('img.me').click
      visit user_calendar_path(user, user.get_me_calendar)

      expect(page).to have_content event.name
    end

    scenario 'I can click outside the create event form and be returned', js: true, :driver => :selenium do
      user = create(:user)
      login_as(user)

      visit user_calendar_path(user, user.calendars.me) 
      click_link 'Add Calendar' 

      expect(find('#background-create-event').visible?).to eq(false)
    end
  end
end
    
