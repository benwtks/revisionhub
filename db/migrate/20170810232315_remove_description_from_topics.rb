class RemoveDescriptionFromTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :topics, :description, :text
  end
end
