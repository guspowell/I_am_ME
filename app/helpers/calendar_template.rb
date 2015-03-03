
 module CalendarTemplate 

 # def set_week_number
 #    self.week_number ||= Date.today.cweek
 #  end

 #  def add_week_number
 #    self.week_number += 1
 #  end 

  def find_monday
    day = Time.now.to_date
      until day.monday? 
        day = day.prev_day
      end 
    @monday = day
  end

  def find_sunday(monday)
    day = monday
      until day.sunday? 
        day =  day.next_day
      end
    @sunday = day
  end

  def find_future_monday(wkid)
    @monday = find_monday
    while wkid > 0
      @monday += 7
      wkid -= 1
    end 
    return @monday
  end 

  def find_future_sunday(wkid)
    @sunday = self.find_sunday(self.find_monday)
    while wkid > 0
      @sunday += 7
      wkid -= 1
    end 
    return @sunday 
  end 


end
