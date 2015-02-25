require 'rails_helper'

feature 'homepage' do

  context 'when I am on the homepage' do

    scenario 'I can see the navbar' do
      visit '/'

      expect(page).to have_css('.header')
      expect(page).to have_xpath("//img[contains(@src, ME.gif)]")
    end
  end
end
