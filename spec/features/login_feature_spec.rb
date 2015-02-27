require 'rails_helper'

feature 'login' do

  context 'Visiting the login page' do

    scenario 'I can see a login form' do
      visit('/')
      expect(page).not_to have_css('.header')
      expect(page).to have_field('password')
      expect(page).to have_field('Email address')
    end
  end

  context 'Signing in' do

    before do
      User.create(email: 'test@test.com', password: '12345678')
    end

    scenario 'I can login' do
      visit('/')
      fill_in 'Email address', with: 'test@test.com'
      fill_in 'password', with: '12345678'
      click_button 'Log in'
      expect(page).to have_css('.header')

    end

    scenario 'I forgot my password' do
      visit('/')
      click_link 'Forgot your password?'
      expect(page).to have_field('Email address')
    end

    scenario 'I dont have an account' do
      visit('/')
      click_link 'Register'
      expect(page).to have_field('password confirmation')
    end

  end

end
