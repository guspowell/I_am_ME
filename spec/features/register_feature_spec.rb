require 'rails_helper'

feature 'login' do

  context 'Visiting the register page' do

    scenario 'I can see a register form' do
      visit('/users/sign_up')
      expect(page).not_to have_css('.header')
      expect(page).to have_field('password confirmation')
    end

    scenario 'I can go back to the login page' do
      visit('/users/sign_up')
      click_link('Log in')
      expect(page).to have_button('Log in')
    end

  end

  context 'Registering' do

    scenario 'Registering with valid credentials' do
      visit('/users/sign_up')
      expect(page).not_to have_css('.header')
      fill_in('Email address', with: 'test@test.com')
      fill_in('password', with: '12345678')
      fill_in('password confirmation', with: '12345678')
      click_button('Sign up')
      expect(page).to have_css('.header')
    end

    scenario 'Registering with an invalid email' do
      visit('/users/sign_up')
      fill_in('Email address', with: 'invalidemail')
      fill_in('password', with: '12345678')
      fill_in('password confirmation', with: '12345678')
      click_button('Sign up')
      expect(page).not_to have_css('.header')
      expect(page).to have_content("Email is invalid Log in")
    end

    scenario 'Registering with different passwords' do
      visit('/users/sign_up')
      fill_in('Email address', with: 'invalidemail')
      fill_in('password', with: '12345678')
      fill_in('password confirmation', with: 'wrong')
      click_button('Sign up')
      expect(page).not_to have_css('.header')
      expect(page).to have_content("Password confirmation doesn't match Password Log in")
    end

  end

end
