class Calendar < ActiveRecord::Base
  has_many :events
  belongs_to :user, dependent: :destroy
end
