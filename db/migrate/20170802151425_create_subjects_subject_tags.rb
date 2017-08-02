class CreateSubjectsSubjectTags < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_subject_tags, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :subject_tag, index: true
      t.timestamps
    end
  end
end
