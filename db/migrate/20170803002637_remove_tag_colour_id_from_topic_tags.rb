class RemoveTagColourIdFromTopicTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :topic_tags, :tagColour_id, :integer
  end
end
