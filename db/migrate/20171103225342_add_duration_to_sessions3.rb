class AddDurationToSessions3 < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :duration, :integer
  end
end
