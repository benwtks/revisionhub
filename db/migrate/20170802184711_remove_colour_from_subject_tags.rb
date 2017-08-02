class RemoveColourFromSubjectTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_tags, :colour, :string
  end
end
