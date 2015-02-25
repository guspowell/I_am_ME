class AddUserIdToCalendars < ActiveRecord::Migration
  def change
    add_reference :calendars, :user, index: true
    add_foreign_key :calendars, :users
  end
end
