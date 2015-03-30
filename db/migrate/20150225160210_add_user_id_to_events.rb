class AddUserIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :user, index: true
    add_foreign_key :events, :users
  end
end
