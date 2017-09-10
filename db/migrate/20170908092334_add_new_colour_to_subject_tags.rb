class AddNewColourToSubjectTags < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_tags, :new_colour, :string
  end
end
