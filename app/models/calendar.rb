class Calendar < ActiveRecord::Base
  attr_accessor :events_ids

  has_many :events
  belongs_to :user, dependent: :destroy

  def find_date
    @today = Time.now
    @day = @time.to_date
    until @day.monday? 
      @day = @day.prev_day
    end 
    p @day.strftime('%Y-%m-%d')
  end

end
