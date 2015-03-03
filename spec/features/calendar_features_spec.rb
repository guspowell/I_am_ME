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
end
    
