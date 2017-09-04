class AddSubjectIdToGrades < ActiveRecord::Migration[5.0]
  def change
    add_reference :grades, :subject, type: :uuid, index: true
  end
end
