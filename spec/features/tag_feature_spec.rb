require 'rails_helper'
require 'formulaic'

feature 'Tags' do

  scenario "adding tags to events" do
    user= create(:user)
    
    login_as(user)

    visit user_calendar_path(user, user.calendars.me)
    
    attrs = attributes_for(:event)
    fill_in_event_form(attrs)
    fill_in 'Tags', with: 'Sports'
    click_button 'submit'

    expect(Event.find_by(name: attrs[:name]).tags.first.name).to eq('Sports')


  end

end
