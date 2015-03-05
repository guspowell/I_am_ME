require 'rails_helper'
require_relative '../../app/view_models/calendar_week.rb'

describe CalendarWeek do 

  it 'should have a number of variables on initialization' do 
    week = CalendarWeek.new(0)
    expect(week.hour).to eq(1)
  end 


end
