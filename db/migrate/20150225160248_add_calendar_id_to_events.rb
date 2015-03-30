class AddCalendarIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :calendar, index: true
    add_foreign_key :events, :calendars
  end
end
