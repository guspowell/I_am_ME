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

  def last_week(day)
    day - 7
  end
 

end
