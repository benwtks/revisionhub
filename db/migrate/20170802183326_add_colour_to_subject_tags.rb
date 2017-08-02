class AddColourToSubjectTags < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_tags, :colour, :string
  end
end
