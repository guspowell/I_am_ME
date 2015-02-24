require 'rails_helper'

RSpec.describe "Events", type: :request do

  let(:event){ Event.create(title: 'Football', date: '01-01-15', description: 'A football match on Saturday' ) }
  
  describe "GET /events.json" do
    
    it "Can return events" do
      get '/events.json'
      expect(response).to have_http_status(200)
    end

    it "Can provide information on events" do
      get '/events.json'
      expect(response).to have_http_status(200)
      expect(response).to have_json_path("title")
    end


  end


end
