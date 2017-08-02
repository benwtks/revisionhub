class RenameTopicTagIdInTopicTagsTopics < ActiveRecord::Migration[5.0]
  def change
    rename_column :topic_tags_topics, :topic_tag_id, :topicTag_id
  end
end
