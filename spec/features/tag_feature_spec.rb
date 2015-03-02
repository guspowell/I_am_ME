require 'rails_helper'

feature 'tags' do


  scenario "adding tags to events" do
    tag = create(:tag, name: "Sports")
    event = create(:event_with_tag, tag: tag)

    expect(event.tags).to_include tag

  end

end