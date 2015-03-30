class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
