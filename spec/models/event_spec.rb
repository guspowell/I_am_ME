require 'rails_helper'
require 'rubygems'

describe Event, :type => :model do

  let(:event){ Event.create(title: 'Football', date: '01-01-15', description: 'A football match on Saturday' ) }

  it 'includes the ID' do
    user.to_json.should have_json path("id")
    user.to_json.should have_json_type(Integer).at_path("id")
  end

end
