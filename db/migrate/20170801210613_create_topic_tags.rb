class CreateTopicTags < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_tags do |t|
      t.string :name
      t.integer :topic_id
      t.integer :student_id

      t.timestamps
    end
  end
end
