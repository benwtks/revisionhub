class AddColourToTopicTags < ActiveRecord::Migration[5.0]
  def change
    add_column :topic_tags, :colour, :string
  end
end
