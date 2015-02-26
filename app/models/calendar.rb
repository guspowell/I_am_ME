class Calendar < ActiveRecord::Base
  attr_accessor :events_ids

  has_many :events
  belongs_to :user, dependent: :destroy

end
