require 'rails_helper'

feature 'Registration' do

  context 'When I am on the registration page' do

    scenario 'I can see a form' do
      visit('/users/sign_up')
      
      expect(page).to have_field('password confirmation')
    end

    scenario 'I can go back to the login page' do
      visit('/users/sign_up')
      click_link('Log in')
      expect(page).to have_button('Log in')
    end

  end

  context 'When I want to register' do

    scenario 'I enter valid credentials and am registered' do
      visit('/users/sign_up')

      sign_up_with(attributes_for(:user, username: "loki"))

      user = User.find_by(username: 'loki')
      expect(current_path).to eq user_calendar_path user, user.get_me_calendar
    end

    scenario 'Registering with an invalid email' do
      visit('/users/sign_up')

      invalid_attributes = attributes_for(:user, email: "emailfailatzombocom")
      sign_up_with(invalid_attributes)
      
      expect(page).to have_content("Email is invalid Log in")
    end

    scenario 'Registering with different passwords' do
      visit('/users/sign_up')
      
      sign_up_with(attributes_for(:user, password_confirmation: 'banaaanas'))
      
      expect(page).to have_content("Password confirmation doesn't match Password Log in")
    end

  end

end
