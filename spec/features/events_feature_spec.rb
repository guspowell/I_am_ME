require 'rails_helper'

feature 'Event' do

  context 'When I want to view an event' do

    scenario 'I can see a small widget' do
      event = create(:event, name: "Mud Fight") 
      user  = create(:user)
      user.get_me_calendar.events << event
      
      login_as(user)
      visit '/' 

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

  context 'deletion' do 

    scenario 'I want to delete an event' do 
      create_event
      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")
      click_button 'Create Event'
      within(:css, '#days-and-calendar') do
        click_link 'Edit'
      end 
      click_link 'Delete'
      expect(page).not_to have_content('Superhero Dance Off')

    end 
  end
end



