class RemoveTopicIdFromTopicTagsTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :topic_tags_topics, :topic_id, :integer
  end
end
