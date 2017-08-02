class RemoveTopicIdFromTopicTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :topic_tags, :topic_id
  end
end
