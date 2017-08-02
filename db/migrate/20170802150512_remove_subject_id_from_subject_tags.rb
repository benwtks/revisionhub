class RemoveSubjectIdFromSubjectTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_tags, :subject_id
  end
end
