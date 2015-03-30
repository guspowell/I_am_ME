module CalendarHelper

  def events_today(events, date)
    events.select {|event| event.date.to_date == date }
  end

  def events_this_hour(events, hour)
    events.select {|event| event.date.hour == hour }.first
  end 
  
end