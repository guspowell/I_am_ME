require 'rails_helper'

RSpec.describe "/users/1/calendars/edit", type: :view do
  before(:each) do
    @user = User.new
    @calendar = assign(:calendar, Calendar.create!(user_id: @user.id))
  end

  it "renders the edit calendar form" do
    render

    assert_select "form[action=?][method=?]", calendar_path(@calendar), "post" do
    end
  end
end
