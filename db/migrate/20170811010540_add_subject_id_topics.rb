class AddSubjectIdTopics < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :subject, type: :uuid, index: true
  end
end
