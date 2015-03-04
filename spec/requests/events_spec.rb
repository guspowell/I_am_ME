require 'rails_helper'

RSpec.describe "Events", type: :request do

  let(:user) { create(:user) }

  describe "GET /events" do

    it "returns event as json" do
      event = create(:event, user: user)
      get "/users/#{user.id}/events/#{event.id}.json"
      expect_json({name: "Football"})
    end
  end

end
