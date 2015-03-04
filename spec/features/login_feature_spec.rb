require 'rails_helper'

feature 'Login' do

  context 'when I want to login' do

   let(:user) { create(:user) }

    scenario 'I input my username and password' do
      login_as(user)

      expect(current_path).to eq user_calendar_path(user, user.get_me_calendar)
    end

    scenario 'I can retrieve my password if I have forgotten it' do
      visit('/')
      click_link 'Forgot your password?'
      expect(page).to have_field('Username')
    end

    scenario 'I dont have an account' do
      visit('/')
      click_link 'Register'
      expect(page).to have_button('Sign up')
    end

  end

end
