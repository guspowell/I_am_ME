require 'rails_helper'

feature 'Tags' do

  scenario "adding tags to events" do
    tag = create(:tag, name: "Sports")
    event = create(:event)

    event.add_tag(tag)

    expect(event.tags).to eq([tag])
  end

end
