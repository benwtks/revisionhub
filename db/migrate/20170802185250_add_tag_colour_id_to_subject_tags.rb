class AddTagColourIdToSubjectTags < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_tags, :tagColour_id, :integer
  end
end
