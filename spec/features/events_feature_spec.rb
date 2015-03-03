require 'rails_helper'

feature 'event' do

  context 'creation' do

    scenario 'I want to create an event' do
      create_event

      attach_file('Image', "#{Rails.root}/spec/support/uploads/spiderman.jpg")
      click_button 'Create Event'

      expect(page).to have_content('Superhero Dance Off')
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


