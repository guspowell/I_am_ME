require 'rails_helper'

RSpec.describe "Events", type: :request do
  
  describe "GET /events" do

    it "returns event as json" do
      event = create(:event)
      get "/events/#{event.id}"
      expect_json({name: "Football"})
    end  
  end

  describe "POST /events" do 

    it "creates an event" do
      post "/events/", :event => {name: "Rollerderby"}
      expect(response).to be_success
      expect(Event.find_by_name("Rollerderby")).not_to be_nil
    end 
  end 


end
