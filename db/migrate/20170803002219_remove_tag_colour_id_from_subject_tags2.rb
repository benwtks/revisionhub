class RemoveTagColourIdFromSubjectTags2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_tags, :tagColour_id, :integer
  end
end
