require 'rails_helper'
require 'rubygems'

describe Event, :type => :model do

  let(:event){ Event.create(title: 'Football', date: '01-01-15', description: 'A football match on Saturday' ) }

  it 'includes the ID' do
    event.to_json.should have_json_path("id")
    event.to_json.should have_json_type(Integer).at_path("id")
  end

  it 'includes the title' do 
    event.to_json.should have_json_path("title")
    event.to_json.should have_json_type(String).at_path("title")
  end

end
