require_relative './init'

feature 'Search' do

  scenario "return results from search" do
    user= create(:user)
    event= create(:event_with_tag)
    
    login_as(user)   

    fill_in 'search', with: 'Sports'
    click_link 'Search'

    expect(expect(page)).to have_content event.name


  end

end
