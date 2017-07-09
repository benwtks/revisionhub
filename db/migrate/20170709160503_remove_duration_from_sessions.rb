class RemoveDurationFromSessions < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :duration, :time
  end
end
