module CalendarHelper

  def events_today(events, date)
    events.select {|event| event.date.to_date == date }.first
  end

  def events_this_hour(event, hour)
      event if event.date.hour == hour
  end 
  
end