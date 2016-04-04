class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :topic_id
      t.time :duration
      t.datetime :date

      t.timestamps null: false
    end
  end
end
