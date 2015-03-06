require_relative './init'

feature 'Search' do

  scenario "return results from search", js: true, :driver => :selenium do
    user = create(:user)
    event= create(:event, name: 'Salsa')
    event.tags << create(:tag, name: 'dancing')
    login_as(user)

    fill_in 'search', with: 'dancing' 
    find('input.search').click 

    expect(page).to have_content event.name
  end

  scenario "ME-ing a search result puts it in my ME calendar", js: true, :driver => :selenium do
    user = create(:user)
    event= create(:event, name: 'Salsa')
    event.tags << create(:tag, name: 'dancing')
    login_as(user)

    fill_in 'search', with: 'dancing' 
    find('input.search').click 

    find('img.more').click
    find('img.me').click
    visit user_calendar_path(user, user.calendars.me)

    expect(page).to have_content event.name
  end
end
