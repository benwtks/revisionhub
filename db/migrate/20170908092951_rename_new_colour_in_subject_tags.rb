class RenameNewColourInSubjectTags < ActiveRecord::Migration[5.0]
  def change
    rename_column :subject_tags, :new_colour, :colour
  end
end
