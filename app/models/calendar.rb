class Calendar < ActiveRecord::Base
  attr_accessor :events_ids, :next

  has_many :events
  belongs_to :user, dependent: :destroy

  def intialize
    @next == 0
  end 

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

  def next_week(day)
    day + 7
  end 

  def add_next
    self.next += 1
  end 

  def subtract_next
    self.next -= 1
  end 

  def find_day
    @day = find_monday
    @sunday = find_sunday(@day)
    
      until self.next == 0
        @day = next_week(@day)
        @sunday = next_week(@sunday)
        subtract_next
      end 

    @day 
    @sunday 
  end 

  def thing 
    until self.next == 0 
      p self.next
      subtract_next
    end
  end
 

end
