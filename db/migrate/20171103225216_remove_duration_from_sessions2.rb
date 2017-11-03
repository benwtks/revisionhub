class RemoveDurationFromSessions2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :duration, :string
  end
end
