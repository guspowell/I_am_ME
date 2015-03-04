class Calendar < ActiveRecord::Base

  attr_accessor :events_ids, :week_number

  scope :me, -> { find_by_name('Me') }

  has_many :events
  belongs_to :user

end
