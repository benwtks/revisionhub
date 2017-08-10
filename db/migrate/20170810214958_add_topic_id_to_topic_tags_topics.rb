class AddTopicIdToTopicTagsTopics < ActiveRecord::Migration[5.0]
  def change
    add_reference :topic_tags_topics, :topic, type: :uuid, index: true
  end
end
