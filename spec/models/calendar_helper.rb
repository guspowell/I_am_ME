require 'rails_helper'
require_relative '../../app/helpers/calendar_helper.rb'

class Calendar; include CalendarHelper; end

describe CalendarHelper do 

  before(:each) do 
    @day = DateTime.new(2015, 03, 03)
    @event= create(:event, date: (@day))
    @calendar= Calendar.new
    @events= Array.new << @event 
  end 

  it 'should return the event for today' do
    p @event.date
    expect(@calendar.events_today(@events, @day )).to eq(@event)
  end 

   it 'should return the event for the current hour' do
    expect(@calendar.events_this_hour(@event, @day.hour)).to eq(@event)
  end 

end