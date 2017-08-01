class CreateSubjectTags < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_tags do |t|
      t.string :name
      t.integer :subject_id
      t.integer :student_id

      t.timestamps
    end
  end
end
