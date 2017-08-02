class CreateTopicTagsTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_tags_topics, id: false do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :topic_tag, index: true
      t.timestamps
    end
  end
end
