require 'rails_helper'

RSpec.describe "users/user_id/calendars/new", type: :view do
  before(:each) do
    assign(:calendar, Calendar.new())
    assign(:user, User.new)
  end

  it "renders new calendar form" do
    render

    assert_select "form[action=?][method=?]", calendars_path, "post" do
    end
  end
end
