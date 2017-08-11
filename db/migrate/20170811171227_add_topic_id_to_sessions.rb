class AddTopicIdToSessions < ActiveRecord::Migration[5.0]
  def change
    add_reference :sessions, :topic, type: :uuid, index: true
  end
end
