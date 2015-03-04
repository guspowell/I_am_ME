class Calendar < ActiveRecord::Base

 include CalendarTemplate

  attr_accessor :events_ids, :week_number

  has_many :events
  belongs_to :user
  module CalendarTemplate
  end

end
