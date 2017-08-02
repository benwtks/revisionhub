class AddTagColourIdToTopicTags < ActiveRecord::Migration[5.0]
  def change
    add_column :topic_tags, :tagColour_id, :integer
  end
end
