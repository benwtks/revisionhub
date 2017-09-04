class AddTopicIdToGrades < ActiveRecord::Migration[5.0]
  def change
    add_reference :grades, :topic, type: :uuid, index: true
  end
end
