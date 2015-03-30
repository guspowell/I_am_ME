class CalendarWeek
  attr_accessor :time, :hours_per_day, :day, :sunday, :hour


  def initialize(week_id)
    @hour = 0
    @date = Date.today
    @hours_per_day = 24
    @day = @date.beginning_of_week + (7 * week_id)
    @sunday = @day.end_of_week
  end

  def reset_hour
    @hour = 0
  end 
end
