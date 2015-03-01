require 'rails_helper'

feature 'event' do

  context 'creation' do

    scenario 'I want to create an event' do
      user = create(:user) 
      create(:calendar, user: user)
      login_as(user)
      
      visit("/users/#{user.id}/events/new")
      
      fill_in 'event_name',      with: 'Superhero Dance Off'
      select '2015'       , from: 'event_date_1i'
      select 'February'      , from: 'event_date_2i'
      select '28'          , from: 'event_date_3i'
      select '12'         , from: 'event_date_4i'
      select '00'         , from: 'event_date_5i'
      fill_in 'event_description', with: 'Why is this happening?'
      fill_in 'event_location', with: 'Hyde Park'
      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")

      click_button 'Create Event'
      save_and_open_page

      expect(page).to have_content('Superhero Dance Off')
    end
  end
end


