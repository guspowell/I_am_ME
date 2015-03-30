require "rails_helper"

RSpec.describe CalendarsController, type: :routing do
  

  describe "routing" do

    before do
       user     = create(:user)
       calendar = create(:calendar, user: user)
    end

    it "routes to #index" do
      expect(:get => "//users/:user_id/calendars").to route_to({"controller"=>"calendars", "action"=>"index", "user_id"=>":user_id"})
    end

    it "routes to #new" do
      expect(:get => "/users/:user_id/calendars/new").to route_to({"controller"=>"calendars", "action"=>"new", "user_id"=>":user_id"})
    end

    it "routes to #show" do
      expect(:get => "/users/:user_id/calendars/:id").to route_to({"controller"=>"calendars", "action"=>"show", "user_id"=>":user_id", "id"=>":id"})
    end

    it "routes to #edit" do
      expect(:get => "/users/:user_id/events/:id/edit").to route_to({"controller"=>"events", "action"=>"edit", "user_id"=>":user_id", "id"=>":id"})
    end

    it "routes to #create" do
      expect(:post => "/users/:user_id/calendars").to route_to({"controller"=>"calendars", "action"=>"create", "user_id"=>":user_id"})
    end

    it "routes to #update" do
      expect(:put => "/users/:user_id/calendars/1").to route_to({"controller"=>"calendars", "action"=>"update", "user_id"=>":user_id", "id"=>"1"})
    end

    it "routes to #destroy" do
      expect(:delete => "/users/:user_id/calendars/1").to route_to({"controller"=>"calendars", "action"=>"destroy", "user_id"=>":user_id", "id"=>"1"})
    end

  end
end
