require 'rails_helper'

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

      visit '/'
      click_link 'Add Calendar' 
    end
  end
end
    
