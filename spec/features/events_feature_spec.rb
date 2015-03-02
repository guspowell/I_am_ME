require 'rails_helper'

feature 'event' do

  context 'creation' do

    scenario 'I want to create an event' do
      user = create(:user) 
      create(:calendar, user: user)
      login_as(user)
      
      visit("/users/#{user.id}/events/new")
      
      fill_form(:event, {  name: 'Superhero Dance Off', 'event_date_1i' => '2015',
                          'event_date_2i'=>'February', 'event_date_3i'=>'28',
                          'event_date_4i'=>'12'      , 'event_date_5i'=>'00',
                          'event_description'=>'Why is this happening?',
                          'event_location'=>   'Hyde Park' })

      
      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")
      click_button 'Create Event'

      expect(page).to have_content('Superhero Dance Off')
    end
  end
end


