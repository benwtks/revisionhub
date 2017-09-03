class AddDurationToSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :duration, :interval
  end
end
